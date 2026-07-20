import 'package:get/get.dart';
import '../controllers/trading_stats_controller.dart';

class TradingStatsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => TradingStatsController());
}
