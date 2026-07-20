import 'package:insighta/repo.dart/records_repository.dart';
import '../models/breeding_record.dart';
import '../models/death_record.dart';
import '../models/sale_record.dart';
import 'mock_data.dart';

class MockRecordsRepository implements IRecordsRepository {
  final List<BreedingRecord> _breedings = MockData.breedings();
  final List<DeathRecord> _deaths = [];
  final List<SaleRecord> _sales = [];

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 300));

  @override
  Future<List<BreedingRecord>> getBreedings() async {
    await _delay();
    return List.unmodifiable(_breedings);
  }

  @override
  Future<BreedingRecord?> getActiveBreedingFor(String femaleId) async {
    await _delay();
    try {
      return _breedings.firstWhere(
          (b) => b.femaleId == femaleId && b.status == BreedingStatus.active);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addBreeding(BreedingRecord r) async {
    await _delay();
    _breedings.add(r);
  }

  @override
  Future<void> updateBreeding(BreedingRecord r) async {
    await _delay();
    final i = _breedings.indexWhere((x) => x.id == r.id);
    if (i != -1) _breedings[i] = r;
  }

  @override
  Future<List<DeathRecord>> getDeaths() async {
    await _delay();
    return List.unmodifiable(_deaths);
  }

  @override
  Future<void> addDeath(DeathRecord r) async {
    await _delay();
    _deaths.add(r);
  }

  @override
  Future<List<SaleRecord>> getSales() async {
    await _delay();
    return List.unmodifiable(_sales);
  }

  @override
  Future<void> addSale(SaleRecord r) async {
    await _delay();
    _sales.add(r);
  }
}