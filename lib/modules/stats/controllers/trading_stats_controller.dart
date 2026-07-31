import 'package:get/get.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/records_repository.dart';
import 'package:insighta/utilities/date_utils.dart';

class TradeMonth {
  final String key;
  final int bought, sold;
  final double buyAmount, sellAmount;
  TradeMonth(this.key, this.bought, this.sold, this.buyAmount, this.sellAmount);
  double get profitPct => buyAmount > 0
      ? (sellAmount - buyAmount) / buyAmount * 100
      : (sellAmount > 0 ? 100 : 0);
}

class TradeYear {
  final String year;
  final int bought, sold;
  final double buyAmount, sellAmount;
  final List<TradeMonth> months;
  TradeYear(this.year, this.bought, this.sold, this.buyAmount, this.sellAmount, this.months);
  double get profitPct => buyAmount > 0
      ? (sellAmount - buyAmount) / buyAmount * 100
      : (sellAmount > 0 ? 100 : 0);
}

class TradingStatsController extends GetxController {
  final IAnimalRepository _animalRepo = Get.find<IAnimalRepository>();
  final IRecordsRepository _recordsRepo = Get.find<IRecordsRepository>();

  final years = <TradeYear>[].obs;
  final totalBought = 0.obs;
  final totalSold = 0.obs;
  final isLoading = false.obs;
  final expanded = <String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    final animals = await _animalRepo.getAll();
    final sales = await _recordsRepo.getSales();

    final purchased = animals
        .where((a) => a.origin == Origin.purchased && a.purchaseDateUtc != null)
        .toList();
    totalBought.value = purchased.length;
    totalSold.value = sales.length;

    // year -> month -> [bought, sold, buyAmount, sellAmount]
    final map = <String, Map<String, List<num>>>{};
    List<num> cell() => [0, 0, 0.0, 0.0];

    String monthKey(int y, int m) => '$y-${m.toString().padLeft(2, '0')}';

    for (final a in purchased) {
      final y = AppDate.yearOfEpoch(a.purchaseDateUtc!).toString();
      final m = monthKey(AppDate.yearOfEpoch(a.purchaseDateUtc!), AppDate.monthOfEpoch(a.purchaseDateUtc!));
      map.putIfAbsent(y, () => {}).putIfAbsent(m, cell);
      map[y]![m]![0] = map[y]![m]![0] + 1;
      map[y]![m]![2] = map[y]![m]![2] + (a.purchasePriceMinor ?? 0) / 100;
    }
    for (final s in sales) {
      final y = AppDate.yearOfEpoch(s.dateUtc).toString();
      final m = monthKey(AppDate.yearOfEpoch(s.dateUtc), AppDate.monthOfEpoch(s.dateUtc));
      map.putIfAbsent(y, () => {}).putIfAbsent(m, cell);
      map[y]![m]![1] = map[y]![m]![1] + 1;
      map[y]![m]![3] = map[y]![m]![3] + s.salePriceMinor / 100;
    }

    final result = <TradeYear>[];
    final sortedYears = map.keys.toList()..sort((a, b) => b.compareTo(a));
    for (final y in sortedYears) {
      final months = <TradeMonth>[];
      int yb = 0, ys = 0;
      double yba = 0, ysa = 0;
      final sortedMonths = map[y]!.keys.toList()..sort((a, b) => b.compareTo(a));
      for (final m in sortedMonths) {
        final c = map[y]![m]!;
        final bought = c[0].toInt(), sold = c[1].toInt();
        final ba = c[2].toDouble(), sa = c[3].toDouble();
        yb += bought;
        ys += sold;
        yba += ba;
        ysa += sa;
        months.add(TradeMonth(m, bought, sold, ba, sa));
      }
      result.add(TradeYear(y, yb, ys, yba, ysa, months));
    }
    years.value = result;
    isLoading.value = false;
  }

  void toggle(String year) {
    expanded.contains(year) ? expanded.remove(year) : expanded.add(year);
    expanded.refresh();
  }
}
