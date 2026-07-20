import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/med_record.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/web_services/catalog_service.dart';
import 'package:insighta/web_services/scanner_service.dart';

enum MedStep { scanId, form, saved }

class MedicalOpController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IMedicalRepository _medRepo = Get.find<IMedicalRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();
  final CatalogService _catalog = Get.find<CatalogService>();

  final idCtrl = TextEditingController();
  final idValue = ''.obs;
  final scanning = false.obs;
  final searching = false.obs;
  final notFound = false.obs;

  final step = MedStep.scanId.obs;
  final animal = Rxn<Animal>();

  // نوع السجل (افتراضياً تطعيم كما في التصميم)
  final medType = MedType.vaccine.obs;
  final selectedName = ''.obs;
  final notes = ''.obs;

  // سجلات الحيوان (لفحص التطعيم المكرر)
  List<MedRecord> _animalRecords = [];

  @override
  void onInit() {
    super.onInit();
    idCtrl.addListener(() => idValue.value = idCtrl.text);
  }

  @override
  void onClose() {
    idCtrl.dispose();
    super.onClose();
  }

  bool get canSearch => idValue.value.trim().isNotEmpty && !searching.value;
  bool get canSave =>
      selectedName.value.trim().isNotEmpty || notes.value.trim().isNotEmpty;

  // العنوان والخيارات حسب النوع
  String get fieldLabel {
    switch (medType.value) {
      case MedType.vaccine:
        return 'اسم المطعوم';
      case MedType.treatment:
        return 'اسم العلاج';
      case MedType.checkup:
        return 'نوع الفحص';
    }
  }

  List<String> get currentOptions {
    switch (medType.value) {
      case MedType.vaccine:
        return _catalog.vaccineNames;
      case MedType.treatment:
        return _catalog.treatmentNames;
      case MedType.checkup:
        return _catalog.checkupTypes;
    }
  }

  void setType(MedType t) {
    medType.value = t;
    selectedName.value = ''; // إعادة ضبط الاختيار عند تغيير النوع
  }

  void addCustom(String v) {
    switch (medType.value) {
      case MedType.vaccine:
        _catalog.addVaccineName(v);
        break;
      case MedType.treatment:
        _catalog.addTreatmentName(v);
        break;
      case MedType.checkup:
        _catalog.addCheckupType(v);
        break;
    }
  }

  /// تحذير التطعيم المكرر: هل أخذ هذا الخروف نفس التطعيم مؤخراً؟
  String? get vaccineWarning {
    if (medType.value != MedType.vaccine) return null;
    final name = selectedName.value.trim();
    if (name.isEmpty) return null;
    final prev = _animalRecords
        .where((r) => r.type == MedType.vaccine && r.description.contains(name))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    if (prev.isEmpty) return null;
    final months = AppDate.monthsBetween(prev.first.date);
    return 'هذا الخروف أخذ هذا التطعيم قبل $months شهر (${AppDate.formatDate(prev.first.date)})';
  }

  Future<void> scan() async {
    scanning.value = true;
    final all = await _animalRepo.getAll();
    final id = await _scanner.scan(
        existing: true, existingIds: all.map((a) => a.id).toList());
    idCtrl.text = id;
    scanning.value = false;
  }

  Future<void> search() async {
    notFound.value = false;
    searching.value = true;
    final a = await _animalRepo.getById(idValue.value.trim());
    if (a != null) _animalRecords = await _medRepo.getMedRecordsFor(a.id);
    searching.value = false;
    if (a == null) {
      notFound.value = true;
      return;
    }
    animal.value = a;
    step.value = MedStep.form;
  }

  String _buildDescription() {
    final name = selectedName.value.trim();
    final note = notes.value.trim();
    if (name.isEmpty) return note;
    return note.isEmpty ? name : '$name – $note';
  }

  Future<void> save() async {
    final a = animal.value;
    if (a == null) return;
    final description = _buildDescription();
    if (description.isEmpty) return;

    await _medRepo.addMedRecord(MedRecord(
      id: 'm${DateTime.now().millisecondsSinceEpoch}',
      animalId: a.id,
      date: AppDate.todayIso(),
      type: medType.value,
      description: description,
      synced: false,
    ));

    // تحديث الرئيسية (تغطية التطعيمات تعتمد على السجلات الطبية)
    if (Get.isRegistered<DashboardController>()) {
      Get.find<DashboardController>().load();
    }

    step.value = MedStep.saved;
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }
}
