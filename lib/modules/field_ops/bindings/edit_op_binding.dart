import 'package:get/get.dart';
import '../controllers/edit_op_controller.dart';

class EditOpBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => EditOpController());
}
