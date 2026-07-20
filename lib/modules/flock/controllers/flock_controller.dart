import 'package:get/get.dart';
import 'package:insighta/app_routes.dart';
import 'package:insighta/models/animal.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/web_services/scanner_service.dart';
import 'profile_args.dart';

class FlockController extends GetxController {
  final IAnimalRepository _repo = Get.find<IAnimalRepository>();
  final ScannerService _scanner = Get.find<ScannerService>();

  final animals = <Animal>[].obs;
  final search = ''.obs;
  final isLoading = false.obs;
  final scanning = false.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    animals.value = await _repo.getAll();
    isLoading.value = false;
  }

  List<Animal> get filtered {
    final q = search.value.trim();
    if (q.isEmpty) return animals;
    return animals.where((a) => a.id.contains(q) || a.breed.contains(q)).toList();
  }

  Future<void> openProfile(String id) async {
    await Get.toNamed(Routes.animalProfile,
        arguments: ProfileArgs(id, backLabel: 'الحلال'));
    load(); // تحديث عند الرجوع
  }

  /// مسح ولحاله يفتح صفحة الخروف الذي وصل معرّفه.
  Future<void> scanAndOpen() async {
    if (animals.isEmpty) return;
    scanning.value = true;
    final id = await _scanner.scan(
        existing: true, existingIds: animals.map((a) => a.id).toList());
    scanning.value = false;
    openProfile(id);
  }
}
