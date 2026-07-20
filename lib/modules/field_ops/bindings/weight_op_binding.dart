import 'package:get/get.dart';
import '../controllers/weight_op_controller.dart';

class WeightOpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeightOpController());
  }
}
