import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/breeding_record.dart';
import 'package:insighta/models/med_record.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import 'package:insighta/modules/flock/controllers/flock_controller.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import 'package:insighta/repo.dart/records_repository.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/utilities/kinship_utils.dart';
import 'package:insighta/web_services/scanner_service.dart';
import 'package:insighta/widgets/animalformstate.dart';



enum BbMode { birth, breeding }
enum BirthStep { parents, details, saved }
enum BreedStep { form, saved }

class BirthBreedingController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IRecordsRepository _recordsRepo = Get.find<IRecordsRepository>();
  final IMedicalRepository _medRepo = Get.find<IMedicalRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();

  final mode = Rxn<BbMode>();
  List<Animal> _all = [];

  // ───────── ولادة ─────────
  final motherCtrl = TextEditingController();
  final fatherCtrl = TextEditingController();
  final motherVal = ''.obs;
  final fatherVal = ''.obs;
  final mother = Rxn<Animal>();
  final father = Rxn<Animal>();
  final detectedBreeding = Rxn<BreedingRecord>();
  final autoFatherMsg = RxnString();
  final birthStep = BirthStep.parents.obs;
  final newbornCtrl = TextEditingController();
  final newbornVal = ''.obs;
  final birthForm = AnimalFormState();
  final scanningMother = false.obs;
  final scanningFather = false.obs;
  final scanningNewborn = false.obs;

  // ───────── تزاوج ─────────
  final femaleCtrl = TextEditingController();
  final maleCtrl = TextEditingController();
  final femaleVal = ''.obs;
  final maleVal = ''.obs;
  final female = Rxn<Animal>();
  final male = Rxn<Animal>();
  final breedDate = AppDate.todayIso().obs;
  final breedStep = BreedStep.form.obs;
  final scanningFemale = false.obs;
  final scanningMale = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadAll();
    motherCtrl.addListener(() {
      motherVal.value = motherCtrl.text;
      _resolveMother();
    });
    fatherCtrl.addListener(() {
      fatherVal.value = fatherCtrl.text;
      _resolveFather();
    });
    femaleCtrl.addListener(() {
      femaleVal.value = femaleCtrl.text;
      _resolveFemale();
    });
    maleCtrl.addListener(() {
      maleVal.value = maleCtrl.text;
      _resolveMale();
    });
  }

  @override
  void onClose() {
    motherCtrl.dispose();
    fatherCtrl.dispose();
    newbornCtrl.dispose();
    femaleCtrl.dispose();
    maleCtrl.dispose();
    super.onClose();
  }

  Future<void> _loadAll() async {
    _all = await _animalRepo.getAll();
  }

  Animal? _find(String id) {
    for (final a in _all) {
      if (a.id == id) return a;
    }
    return null;
  }

  void selectMode(BbMode m) => mode.value = m;

  // ── الولادة ──
  Future<void> _resolveMother() async {
    final id = motherVal.value.trim();
    if (id.isEmpty) {
      mother.value = null;
      detectedBreeding.value = null;
      autoFatherMsg.value = null;
      return;
    }
    final a = _find(id);
    mother.value = a;
    if (a == null) return;
    // كشف تلقائي للأب من سجل التزاوج الفعّال
    final br = await _recordsRepo.getActiveBreedingFor(a.id);
    detectedBreeding.value = br;
    if (br != null) {
      fatherCtrl.text = br.maleId; // يملأ الأب تلقائياً
      autoFatherMsg.value =
          'الأب: ${br.maleId} · من سجل تزاوج تاريخ ${AppDate.formatDate(br.date)}';
    } else {
      autoFatherMsg.value = null;
    }
  }

  void _resolveFather() {
    final id = fatherVal.value.trim();
    father.value = id.isEmpty ? null : _find(id);
  }

  bool get canNextBirth => mother.value != null;

  void nextBirth() {
    if (!canNextBirth) return;
    birthForm.origin.value = Origin.born;
    birthForm.motherId.value = mother.value!.id;
    birthForm.fatherId.value = father.value?.id ?? fatherVal.value.trim();
    birthStep.value = BirthStep.details;
  }

  Future<void> scanNewborn() async {
    scanningNewborn.value = true;
    final id = await _scanner.scan(); // شريحة جديدة
    newbornCtrl.text = id;
    newbornVal.value = id;
    scanningNewborn.value = false;
  }

  bool get canSaveBirth => newbornVal.value.trim().isNotEmpty && mother.value != null;

  Future<void> saveBirth() async {
    final id = newbornVal.value.trim();
    final m = mother.value;
    if (id.isEmpty || m == null) return;

    // 1) إضافة المولود مربوطاً بأبويه
    await _animalRepo.add(birthForm.toAnimal(id));

    // 2) تحديث حالة الأم → بصحة جيدة
    await _animalRepo.update(m.copyWith(status: AnimalStatus.healthy));

    // 3) إغلاق سجل التزاوج إن وُجد
    final br = detectedBreeding.value;
    if (br != null) {
      await _recordsRepo.updateBreeding(br.copyWith(status: BreedingStatus.completed));
    }

    // 4) توثيق الولادة في السجل الطبي للأم
    await _medRepo.addMedRecord(MedRecord(
      id: 'm${DateTime.now().millisecondsSinceEpoch}',
      animalId: m.id,
      date: AppDate.todayIso(),
      type: MedType.checkup,
      description: 'ولادة - مولود جديد $id',
      synced: false,
    ));

    _refreshOthers();
    birthStep.value = BirthStep.saved;
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }

  // ── التزاوج ──
  void _resolveFemale() {
    final id = femaleVal.value.trim();
    female.value = id.isEmpty ? null : _find(id);
  }

  void _resolveMale() {
    final id = maleVal.value.trim();
    male.value = id.isEmpty ? null : _find(id);
  }

  Future<void> scanFemale() async => _scanInto(femaleCtrl, scanningFemale);
  Future<void> scanMale() async => _scanInto(maleCtrl, scanningMale);
  Future<void> scanMother() async => _scanInto(motherCtrl, scanningMother);
  Future<void> scanFather() async => _scanInto(fatherCtrl, scanningFather);

  Future<void> _scanInto(TextEditingController ctrl, RxBool flag) async {
    flag.value = true;
    final id = await _scanner.scan(
        existing: true, existingIds: _all.map((a) => a.id).toList());
    ctrl.text = id;
    flag.value = false;
  }

  /// تحذير القرابة (شجرة العائلة) — يمنع زواج الأقارب لسلامة القطيع.
  String? get kinshipWarning {
    final f = female.value, m = male.value;
    if (f == null || m == null) return null;
    return Kinship.checkRelated(f, m, _all);
  }

  bool get canSaveBreeding => female.value != null && male.value != null;

  Future<void> saveBreeding() async {
    final f = female.value, m = male.value;
    if (f == null || m == null) return;

    // 1) سجل تزاوج جديد
    await _recordsRepo.addBreeding(BreedingRecord(
      id: 'br${DateTime.now().millisecondsSinceEpoch}',
      femaleId: f.id,
      maleId: m.id,
      date: breedDate.value,
      status: BreedingStatus.active,
    ));

    // 2) حالة الأنثى → حامل
    await _animalRepo.update(f.copyWith(status: AnimalStatus.pregnant));

    // 3) توثيق التزاوج في السجل الطبي للطرفين
    final dateFmt = AppDate.formatDate(breedDate.value);
    await _medRepo.addMedRecord(MedRecord(
      id: 'mf${DateTime.now().millisecondsSinceEpoch}',
      animalId: f.id,
      date: breedDate.value,
      type: MedType.checkup,
      description: 'تزاوج مع ${m.id} · بداية حمل ($dateFmt)',
      synced: false,
    ));
    await _medRepo.addMedRecord(MedRecord(
      id: 'mm${DateTime.now().millisecondsSinceEpoch}',
      animalId: m.id,
      date: breedDate.value,
      type: MedType.checkup,
      description: 'تزاوج مع ${f.id} ($dateFmt)',
      synced: false,
    ));

    _refreshOthers();
    breedStep.value = BreedStep.saved;
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }

  void _refreshOthers() {
    if (Get.isRegistered<DashboardController>()) Get.find<DashboardController>().load();
    if (Get.isRegistered<FlockController>()) Get.find<FlockController>().load();
  }
}
