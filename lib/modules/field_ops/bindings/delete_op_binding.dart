import 'package:get/get.dart';
import '../controllers/delete_op_controller.dart';

class DeleteOpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeleteOpController());
  }
}
