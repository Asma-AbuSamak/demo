import 'package:get/get.dart';
import '../controllers/medicine_form_controller.dart';

class MedicineFormBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MedicineFormController());
}
