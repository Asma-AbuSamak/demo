# خطة الترحيل إلى Local Database + Sync (insighta)

مواصفات تنفيذية لـ Claude Code. المشروع: Flutter + GetX (اسم الباكج `insighta`).
الهدف: تحويل التطبيق من mock data إلى **local database حقيقية (Drift/SQLite)** مصدرها الوحيد للـ UI، مع **طبقة مزامنة (Sync)** بالاتجاهين مع الباك اند، وتشغيل offline-first.

> ملاحظة عامة: لا تلمس طبقة الـ UI (Views). التبديل يتم خلف `Repository` interfaces الموجودة. انتقل موديول موديول.

---

## 0. القرارات المعمارية الثابتة

- **المحرك:** [Drift](https://drift.simonbinder.eu/) (SQLite reactive, type-safe, WAL, isolate-friendly). لا تستخدم Isar.
- **مصدر الحقيقة للـ UI:** اللوكال DB فقط. الـ UI يقرأ عبر `.watch()` ويكتب عبر الـ Repository المحلي. لا يعرف عن السيرفر شيء.
- **المزامنة:** `SyncService` منفصل تماماً، يقرأ/يكتب نفس جداول Drift، ويتواصل مع الباك اند بالخلفية.
- **المعرّفات:** UUID مولّدة من العميل (String id) — idempotent.
- **الأوقات:** `int` epoch UTC (كما هو الآن).
- **الـ enums:** تُخزّن كـ `int` (index) في الـ DB.

الطبقات:

```
UI (Views)
  ↕ reactive (.watch)
Controller (GetX)
  ↕
IRepository (نفس الـ interfaces الحالية)
  ↕
Drift DAO  ← مصدر الحقيقة

SyncService (منفصل) ⇄ Backend API   (يقرأ/يكتب نفس جداول Drift)
```

---

## 1. إعداد Drift

أضف الاعتماديات في `pubspec.yaml`:

```yaml
dependencies:
  drift: ^2.x
  sqlite3_flutter_libs: ^0.5.x
  path_provider: ^2.x
  path: ^1.x
  connectivity_plus: ^6.x   # لكشف عودة الاتصال

dev_dependencies:
  drift_dev: ^2.x
  # build_runner موجود مسبقاً
```

- أنشئ `lib/database/app_database.dart` يحوي تعريف الجداول والـ DAOs.
- شغّل الـ DB على background isolate.
- فعّل WAL mode (افتراضي في Drift).
- استراتيجية migrations عبر `MigrationStrategy` (ابدأ schemaVersion = 1، وseed أولي).

---

## 2. الجداول (Schema)

اعكس الموديلات المولّدة بـ freezed على جداول Drift. طبّق **نفس حقول المزامنة الموجودة** في الموديلات:
`rowVersion`, `isDeleted`, `syncStatus`, `createdAtUtc`, `updatedAtUtc`, `lastSyncedAtUtc`.

قواعد عامة لكل جدول:
- `syncStatus` قيَم: `pending` / `synced` / `error`.
- **Indexes** إجبارية على: `farmId`, `updatedAtUtc`, `syncStatus`, `isDeleted`.
- الصور/الفيديو: خزّن **المسار (path)** فقط، والملف على القرص — لا blob في الـ DB.

### 2.1 جدول الحيوانات `animals`
اعكس موديل `Animal`. **أضف حقلين جديدين (snapshot للأنساب):**

```
motherTag  TEXT NULL   // رقم تسمية الأم وقت الإنشاء
fatherTag  TEXT NULL   // رقم تسمية الأب وقت الإنشاء
```

هدفها: شبكة أمان لشجرة العيلة إذا اختفى سجل الأب/الأم لأي سبب.

باقي الجداول: `breeding_records`, `death_records`, `medicin_logs`, `med_records`, `medicines`, `sale_records`, `vaccine_protocols`, `vendors`, `weight_records`, `animals` — كل واحد يعكس الموديل المقابل في `lib/models/`.

### 2.2 جدول الثوابت `catalog_items` (بديل AppConstants)

```
catalog_items(
  id            TEXT PK,
  category      TEXT,        // 'breed' | 'vaccineName' | 'treatmentName'
                             // | 'diseaseType' | 'checkupType' | 'deathCause'
                             // | 'unit' | 'medicineReason' | 'schedule' | 'interval'
  value         TEXT,        // القيمة البرمجية
  label         TEXT,        // النص المعروض (عربي)
  extra         TEXT NULL,   // JSON للحقول الإضافية (مثل months/days)
  sortOrder     INTEGER,
  scope         TEXT,        // 'global' | 'farm'
  farmId        TEXT NULL,   // فاضي إذا scope='global'
  isDefault     INTEGER,     // bool: عنصر مزروع افتراضي
  isDeleted     INTEGER,     // soft delete
  syncStatus    TEXT,
  rowVersion    INTEGER,
  updatedAtUtc  INTEGER
)
```
Index على `(category, scope, farmId)`.

**Seeding:** عند أول تشغيل فقط، ازرع القوائم من `AppConstants` الحالية كـ `scope='global'`, `isDefault=1`. بعدها `AppConstants` تبقى كـ seed source فقط ولا تُقرأ في وقت التشغيل.

**قواعد النطاق (scope):**
- `scope='global'` (بدون farmId) → يظهر لكل المزارعين، يديره السيرفر/الأدمن.
- `scope='farm'` → يظهر لمزرعته فقط (فلترة بـ `farmId`).
- تحويل عنصر من `farm` إلى `global` = عبر **approval** في الباك اند فقط، ليس تلقائياً.

---

## 3. الطبقة المنطقية

### 3.1 CatalogService
عدّل `lib/web_services/catalog_service.dart`:
- بدل القراءة من `AppConstants`، اقرأ من `catalog_items` عبر Drift `.watch()` مفلترة بـ `category` و`(scope='global' OR farmId = currentFarm)` و`isDeleted=0`.
- اعرض القوائم كـ reactive (`.obs` / stream) — تبقى الـ UI تلقائية التحديث.
- عمليات الإضافة/التعديل تكتب للـ DB بـ `scope='farm'` و`syncStatus='pending'`.

### 3.2 Repositories
- أنشئ `Drift{X}Repository implements I{X}Repository` لكل ريبو في `lib/repo.dart/`.
- نفس التواقيع (getAll/getById/add/update/delete) بدون تغيير في الـ interface.
- `add`/`update`: اضبط `updatedAtUtc = now`, `syncStatus='pending'`, وزد `rowVersion`.
- `delete`: **soft delete** (`isDeleted=1`, `syncStatus='pending'`) — لا حذف فعلي.
- `add` للحيوان: عبّي `motherTag`/`fatherTag` من الأب/الأم الحاليين (snapshot).
- بدّل الـ bindings لتحقن Drift repos بدل الـ Mock (`Get.put`/`Get.lazyPut`).

---

## 4. شجرة العيلة + الحذف

- **كويري شجرة العيلة يتجاهل `isDeleted`**: عند حل `motherId`/`fatherId` جِب السجل حتى لو محذوف. الفلترة `isDeleted=0` تطبَّق على القوائم العادية فقط.
- **دورة الحياة ≠ حذف**: الحيوان النافق/المباع = تغيير `status` (dead/sold)، يبقى للأبد ويظهر في الشجرة. الحذف (`isDeleted`) للأخطاء/التكرارات فقط.
- **حارس مرجعي (referential guard)** قبل أي purge نهائي مستقبلي:
  ```
  إذا وُجد أي حيوان يشير لهذا كـ motherId/fatherId → امنع الحذف النهائي، أبقه soft-deleted.
  ```
- إن اختفى السجل رغم ذلك، الشجرة تعرض `motherTag`/`fatherTag` (الـ snapshot) فلا تنكسر.

---

## 5. طبقة المزامنة `SyncService` (نمط Outbox)

أنشئ `lib/web_services/sync_service.dart` (GetxService)، والباك اند عبر `catalog_service`/`http` الموجود.

**Push (رفع):**
- اجمع كل الصفوف `syncStatus='pending'` من كل الجداول.
- ابعثها للباك اند (عبر `toSyncPayload()` الموجود). المعرّفات UUID → idempotent.
- عند النجاح: `syncStatus='synced'`, حدّث `lastSyncedAtUtc`. عند الفشل: `syncStatus='error'` + retry.

**Pull (تنزيل) — delta sync:**
- احفظ cursor لكل جدول (آخر `updatedAtUtc` تمت مزامنته).
- اطلب من الباك اند `changedSince=cursor` لكل جدول (بما فيها `catalog_items` العامة).
- ادخل النتائج داخل **transaction/batch واحدة**.

**حل التعارض:** last-write-wins حسب `rowVersion` ثم `updatedAtUtc` (أو اعتبر السيرفر مرجعاً نهائياً — اختر سياسة واحدة وثبّتها).

**التشغيل (triggers):**
- عند عودة الاتصال (`connectivity_plus`).
- عند استئناف التطبيق (app resume).
- دورياً (مثلاً كل X دقائق).
- يدوياً (زر تحديث).
- مع **exponential backoff** عند الفشل.

---

## 6. أفضل الممارسات (أداء + ذاكرة) — إلزامية

- **Pagination** لكل القوائم الكبيرة (`LIMIT/OFFSET` أو keyset). لا تحمّل كل السجلات في الذاكرة.
- **Batch داخل transaction** لإدخالات المزامنة.
- **`.watch()` مضبوط**: على كويري محدد بأعمدة محددة (لا `SELECT *`). dispose الاشتراكات في `onClose` للـ controller.
- العمليات الثقيلة على **background isolate**.
- **enums كـ int**، الأوقات كـ int epoch.
- تجنّب N+1 عبر joins.
- **Soft delete** + تنظيف دوري + `VACUUM` لاسترجاع المساحة (مع احترام الحارس المرجعي).
- Indexes كما في القسم 2.

---

## 7. ترتيب التنفيذ

1. إعداد Drift + `AppDatabase` + migration/seed.
2. جدول `animals` + `AnimalDao` + `DriftAnimalRepository` (أضف `motherTag`/`fatherTag`).
3. جدول `catalog_items` + seeding + تحويل `CatalogService`.
4. ربط bindings الحيوانات + التأكد أن الموديول يعمل من الـ DB.
5. باقي الموديولات (inventory, medical, records) — repo repo.
6. `SyncService` (Push ثم Pull ثم triggers).
7. اختبارات: كتابة offline → pending، عودة النت → مزامنة، تعارض نسختين، seed الكاتالوج، شجرة عيلة مع أب محذوف.

ابدأ بموديول **الحيوانات** لأنه المركزي.

---

## 8. التحقق (Definition of Done)

- الـ UI يقرأ/يكتب من اللوكال DB فقط (لا استدعاء مباشر للـ API من الـ Views/Controllers).
- الكتابة تعمل بدون إنترنت وتُعلّم `pending`.
- المزامنة تعمل بالاتجاهين ولا تُنشئ تكرارات.
- `AppConstants` لم تعد تُقرأ في وقت التشغيل (seed فقط).
- شجرة العيلة تصمد عند حذف/فقدان سجل أب أو أم.
- unit tests للـ `SyncService` بموك API خضراء.
