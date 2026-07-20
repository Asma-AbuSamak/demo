import 'package:get/get.dart';
import 'package:insighta/repo.dart/records_repository.dart';

class DeathMonth {
  final String key; // yyyy-MM
  final int total;
  final List<MapEntry<String, int>> causes;
  DeathMonth(this.key, this.total, this.causes);
}

class DeathYear {
  final String year;
  final int total;
  final List<DeathMonth> months;
  DeathYear(this.year, this.total, this.months);
}

class DeletedStatsController extends GetxController {
  final IRecordsRepository _repo = Get.find<IRecordsRepository>();

  final years = <DeathYear>[].obs;
  final total = 0.obs;
  final isLoading = false.obs;
  final expanded = <String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    isLoading.value = true;
    final deaths = await _repo.getDeaths();
    total.value = deaths.length;

    // year -> month -> cause -> count
    final map = <String, Map<String, Map<String, int>>>{};
    for (final d in deaths) {
      final y = d.date.substring(0, 4);
      final m = d.date.substring(0, 7);
      map.putIfAbsent(y, () => {});
      map[y]!.putIfAbsent(m, () => {});
      map[y]![m]!.update(d.cause, (v) => v + 1, ifAbsent: () => 1);
    }

    final result = <DeathYear>[];
    final sortedYears = map.keys.toList()..sort((a, b) => b.compareTo(a));
    for (final y in sortedYears) {
      final months = <DeathMonth>[];
      int yearTotal = 0;
      final sortedMonths = map[y]!.keys.toList()..sort((a, b) => b.compareTo(a));
      for (final m in sortedMonths) {
        final causes = map[y]![m]!.entries.toList();
        final monthTotal = causes.fold<int>(0, (s, e) => s + e.value);
        yearTotal += monthTotal;
        months.add(DeathMonth(m, monthTotal, causes));
      }
      result.add(DeathYear(y, yearTotal, months));
    }
    years.value = result;
    isLoading.value = false;
  }

  void toggle(String year) {
    if (expanded.contains(year)) {
      expanded.remove(year);
    } else {
      expanded.add(year);
    }
    expanded.refresh();
  }
}
