import 'package:get/get.dart';
import 'package:insighta/modules/dashboard/dashboard_controller.dart';
import 'package:insighta/modules/shell/nav_controller.dart';
import 'package:insighta/modules/field_ops/controllers/field_ops_controller.dart';
import 'package:insighta/modules/flock/controllers/flock_controller.dart';
import 'package:insighta/modules/inventory/controllers/inventory_controller.dart';

/// يحقن كونترولر الشِل + كونترولرات التبويبات الأربعة.
class ShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => FieldOpsController());
    Get.lazyPut(() => FlockController());
    Get.lazyPut(() => InventoryController());
  }
}