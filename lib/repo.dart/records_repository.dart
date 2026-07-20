import '../models/breeding_record.dart';
import '../models/death_record.dart';
import '../models/sale_record.dart';

abstract class IRecordsRepository {
  Future<List<BreedingRecord>> getBreedings();
  Future<BreedingRecord?> getActiveBreedingFor(String femaleId);
  Future<void> addBreeding(BreedingRecord r);
  Future<void> updateBreeding(BreedingRecord r);

  Future<List<DeathRecord>> getDeaths();
  Future<void> addDeath(DeathRecord r);

  Future<List<SaleRecord>> getSales();
  Future<void> addSale(SaleRecord r);
}