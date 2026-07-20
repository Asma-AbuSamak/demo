import 'package:get/get.dart';
import '../controllers/medical_op_controller.dart';

class MedicalOpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalOpController());
  }
}
