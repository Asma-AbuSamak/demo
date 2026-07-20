import 'package:get/get.dart';
import '../controllers/deleted_stats_controller.dart';

class DeletedStatsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => DeletedStatsController());
}
