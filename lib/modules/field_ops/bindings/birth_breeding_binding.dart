import 'package:get/get.dart';
import '../controllers/birth_breeding_controller.dart';

class BirthBreedingBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => BirthBreedingController());
}
