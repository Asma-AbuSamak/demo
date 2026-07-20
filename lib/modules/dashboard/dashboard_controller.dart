import 'package:get/get.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/models/med_record.dart';
import 'package:insighta/models/vaccine_protocol.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import 'package:insighta/repo.dart/records_repository.dart';


class VaccineStat {
  final String name;
  final int count;
  final int notCount;
  const VaccineStat(this.name, this.count, this.notCount);
}

class DashboardController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IMedicalRepository _medRepo = Get.find<IMedicalRepository>();
  final IRecordsRepository _recordsRepo = Get.find<IRecordsRepository>();

  final animals = <Animal>[].obs;
  final medRecords = <MedRecord>[].obs;
  final protocols = <VaccineProtocol>[].obs;
  final deathsCount = 0.obs;
  final soldCount = 0.obs;
  final isLoading = false.obs;
  final vaccineExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    animals.value = await _animalRepo.getAll();
    medRecords.value = await _medRepo.getMedRecords();
    protocols.value = await _medRepo.getProtocols();
    deathsCount.value = (await _recordsRepo.getDeaths()).length;
    soldCount.value = (await _recordsRepo.getSales()).length;
    isLoading.value = false;
  }

  int get total => animals.length;
  int get males => animals.where((a) => a.gender == Gender.male).length;
  int get females => animals.where((a) => a.gender == Gender.female).length;

  List<Animal> get sick =>
      animals.where((a) => a.status == AnimalStatus.sick).toList();
  List<Animal> get pregnant =>
      animals.where((a) => a.status == AnimalStatus.pregnant).toList();

  int get totalPurchased =>
      animals.where((a) => a.origin == Origin.purchased).length;
  int get totalSold => soldCount.value;

  /// تغطية التطعيمات — القائمة تأتي من "المطاعيم" المسجّلة في البروتوكولات
  /// (علاجات ومطاعيم)، ولكل مطعوم نحسب كم خروف أخذه مقابل من لم يأخذه.
  List<VaccineStat> get vaccineStats {
    final vaccineRecs =
        medRecords.where((r) => r.type == MedType.vaccine).toList();
    final result = <VaccineStat>[];
    for (final p in protocols.where((p) => p.type == ProtocolType.vaccine)) {
      final takers = vaccineRecs
          .where((r) => r.description.contains(p.name))
          .map((r) => r.animalId)
          .toSet();
      result.add(VaccineStat(
          p.name, takers.length, (total - takers.length).clamp(0, total)));
    }
    return result;
  }

  void toggleVaccine() => vaccineExpanded.toggle();
}
