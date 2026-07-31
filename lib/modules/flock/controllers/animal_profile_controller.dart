import 'package:get/get.dart';

import 'package:insighta/app_routes.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/models/med_record/med_record.dart';
import 'package:insighta/models/weight_record/weight_record.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import '../../animal_list/controllers/animal_list_controller.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import '../../flock/controllers/flock_controller.dart';
import 'profile_args.dart';

class AnimalProfileController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IMedicalRepository _medRepo = Get.find<IMedicalRepository>();

  final dynamic _args = Get.arguments;

  final animal = Rxn<Animal>();
  final records = <MedRecord>[].obs;
  final weights = <WeightRecord>[].obs;
  final isLoading = false.obs;
  final currentTab = 0.obs; // 0=البيانات 1=السجل الطبي 2=شجرة العائلة
  bool _tabInit = false;

  String get animalId =>
      _args is ProfileArgs ? (_args ).id : _args as String;
  String get backLabel =>
      _args is ProfileArgs ? (_args ).backLabel : 'رجوع';

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    animal.value = await _animalRepo.getById(animalId);

    final recs = await _medRepo.getMedRecordsFor(animalId);
    recs.sort((a, b) => b.dateUtc.compareTo(a.dateUtc));
    records.value = recs;

    final w = await _medRepo.getWeightsFor(animalId);
    w.sort((a, b) => b.dateUtc.compareTo(a.dateUtc));
    weights.value = w;

    // أول مرة: افتح تبويب السجل الطبي إن كان مريضاً/حاملاً (لإظهار زر الإجراء)
    if (!_tabInit) {
      final s = animal.value?.status;
      currentTab.value =
          (s == AnimalStatus.sick || s == AnimalStatus.pregnant) ? 1 : 0;
      _tabInit = true;
    }
    isLoading.value = false;
  }

  bool get hasAction {
    final s = animal.value?.status;
    return s == AnimalStatus.sick || s == AnimalStatus.pregnant;
  }

  String get ageText => animal.value?.birthDateUtc == null
      ? ''
      : AppDate.calcAgeEpoch(animal.value!.birthDateUtc!);

  List<WeightRecord> get lastWeights => weights.take(3).toList();

  void openParent(String? id) {
    if (id == null || id.isEmpty) return;
    Get.toNamed(Routes.animalProfile, arguments: ProfileArgs(id, backLabel: 'رجوع'));
  }

  /// إجراء موحّد: شفاء (مريض) أو ولادة (حامل) → يصبح بصحة جيدة + سجل مؤرّخ.
  Future<void> registerAction() async {
    final a = animal.value;
    if (a == null) return;
    final description = a.status == AnimalStatus.sick
        ? 'تم الشفاء - الحالة الصحية أصبحت جيدة'
        : 'تمت الولادة بنجاح';

    await _medRepo.addMedRecord(MedRecord(
      id: 'm${DateTime.now().millisecondsSinceEpoch}',
      animalId: a.id,
      dateUtc: AppDate.todayEpoch(),
      type: MedType.checkup,
      description: description,
      createdAtUtc: AppDate.nowEpoch(),
      updatedAtUtc: AppDate.nowEpoch(),
    ));
    await _animalRepo.update(a.copyWith(status: AnimalStatus.healthy));

    if (Get.isRegistered<AnimalListController>()) Get.find<AnimalListController>().load();
    if (Get.isRegistered<DashboardController>()) Get.find<DashboardController>().load();
    if (Get.isRegistered<FlockController>()) Get.find<FlockController>().load();

    await load();
  }
}
