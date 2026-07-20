import 'package:get/get.dart';
import '../controllers/inventory_index_controller.dart';

class InventoryIndexBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => InventoryIndexController());
}
