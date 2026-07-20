import 'package:get/get.dart';
import 'package:collection/collection.dart';

import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/models/vaccine_protocol.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import 'package:insighta/web_services/catalog_service.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';

class ProtocolsController extends GetxController {
  final IMedicalRepository _medRepo = Get.find<IMedicalRepository>();
  final CatalogService catalog = Get.find<CatalogService>();

  final protocols = <VaccineProtocol>[].obs;
  final isLoading = false.obs;

  // نموذج الإضافة (يُستخدم في شاشة إضافة مطعوم/علاج)
  final formName = ''.obs;
  final formDisease = ''.obs;      // للعلاج فقط
  final formLastDate = ''.obs;     // تاريخ التطعيم / أخذ العلاج
  final formSchedule = ''.obs;     // للمطعوم: سنوياً...
  final formInterval = ''.obs;     // للعلاج: كل 6 أشهر...
  final formNextDate = ''.obs;     // يُحسب تلقائياً أو يدوياً

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    protocols.value = await _medRepo.getProtocols();
    isLoading.value = false;
  }

  List<VaccineProtocol> get vaccines =>
      protocols.where((p) => p.type == ProtocolType.vaccine).toList();
  List<VaccineProtocol> get treatments =>
      protocols.where((p) => p.type == ProtocolType.treatment).toList();

  bool isOverdue(VaccineProtocol p) =>
      p.nextDate != null && p.nextDate!.isNotEmpty && AppDate.isExpired(p.nextDate!);

  // ── نموذج الإضافة ──
  void resetForm() {
    formName.value = '';
    formDisease.value = '';
    formLastDate.value = '';
    formSchedule.value = '';
    formInterval.value = '';
    formNextDate.value = '';
  }

  /// حساب تاريخ الجرعة القادمة تلقائياً للمطعوم (حسب الجدول بالأشهر).
  void recomputeVaccineNext() {
    final opt = catalog.scheduleByLabel(formSchedule.value);
    if (opt != null && opt.months > 0 && formLastDate.value.isNotEmpty) {
      final d = DateTime.parse(formLastDate.value);
      formNextDate.value =
          AppDate.addMonthsIso(d, opt.months); // تعبئة تلقائية
    }
  }

  /// حساب تاريخ الجرعة القادمة تلقائياً للعلاج (حسب الفترة بالأيام).
  void recomputeTreatmentNext() {
    final opt = catalog.intervalByLabel(formInterval.value);
    if (opt != null && opt.days > 0 && formLastDate.value.isNotEmpty) {
      final d = DateTime.parse(formLastDate.value);
      formNextDate.value = AppDate.addDaysIso(d, opt.days);
    }
  }

  bool get canSaveVaccine => formName.value.trim().isNotEmpty;
  bool get canSaveTreatment => formName.value.trim().isNotEmpty;

  /// حفظ مطعوم: لو الاسم موجود → تحديث نفس البروتوكول (لا تكرار).
  Future<void> saveVaccine() async {
    final name = formName.value.trim();
    if (name.isEmpty) return;
    catalog.addVaccineName(name); // يظهر في قائمة العلاج/الفحص أيضاً

    final existing = vaccines.firstWhereOrNull((p) => p.name == name);
    if (existing != null) {
      // إضافة على سجل موجود: التاريخ الجديد يصبح "آخر جرعة" + جرعة قادمة جديدة
      await _medRepo.updateProtocol(existing.copyWith(
        schedule: formSchedule.value,
        lastDate: formLastDate.value,
        nextDate: formNextDate.value,
      ));
    } else {
      await _medRepo.addProtocol(VaccineProtocol(
        id: 'p${DateTime.now().millisecondsSinceEpoch}',
        type: ProtocolType.vaccine,
        name: name,
        schedule: formSchedule.value,
        lastDate: formLastDate.value,
        nextDate: formNextDate.value,
      ));
    }
    await load();
    _refreshDashboard();
  }

  /// حفظ علاج: نفس منطق التحديث عند وجود الاسم مسبقاً.
  Future<void> saveTreatment() async {
    final name = formName.value.trim();
    if (name.isEmpty) return;
    catalog.addTreatmentName(name);
    if (formDisease.value.trim().isNotEmpty) {
      catalog.addDiseaseType(formDisease.value.trim());
    }

    final existing = treatments.firstWhereOrNull((p) => p.name == name);
    if (existing != null) {
      await _medRepo.updateProtocol(existing.copyWith(
        diseaseType: formDisease.value,
        dosageInterval: formInterval.value,
        lastDate: formLastDate.value,
        nextDate: formNextDate.value,
      ));
    } else {
      await _medRepo.addProtocol(VaccineProtocol(
        id: 'p${DateTime.now().millisecondsSinceEpoch}',
        type: ProtocolType.treatment,
        name: name,
        diseaseType: formDisease.value,
        dosageInterval: formInterval.value,
        lastDate: formLastDate.value,
        nextDate: formNextDate.value,
      ));
    }
    await load();
    _refreshDashboard();
  }

  Future<void> deleteProtocol(String id) async {
    await _medRepo.deleteProtocol(id);
    await load();
    _refreshDashboard();
  }

  void _refreshDashboard() {
    if (Get.isRegistered<DashboardController>()) {
      Get.find<DashboardController>().load();
    }
  }
}
