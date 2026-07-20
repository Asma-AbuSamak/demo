import 'package:get/get.dart';
import '../controllers/animal_profile_controller.dart';

class AnimalProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimalProfileController());
  }
}
