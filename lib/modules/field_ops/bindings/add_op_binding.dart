import 'package:get/get.dart';
import '../controllers/add_op_controller.dart';

class AddOpBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => AddOpController());
}
