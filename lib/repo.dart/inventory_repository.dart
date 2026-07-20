import 'package:insighta/models/midicine.dart';
import '../models/vendor.dart';
import '../models/medicine_log.dart';

abstract class IInventoryRepository {
  // Medicines
  Future<List<Medicine>> getMedicines();
  Future<void> addMedicine(Medicine m);
  Future<void> updateMedicine(Medicine m);
  Future<void> deleteMedicine(String id);

  // Vendors
  Future<List<Vendor>> getVendors();
  Future<void> addVendor(Vendor v);
  Future<void> updateVendor(Vendor v);
  Future<void> deleteVendor(String id);

  // Medicine Logs
  Future<List<MedicineLog>> getLogs();
  Future<List<MedicineLog>> getLogsFor(String medicineId);
  Future<void> addLog(MedicineLog log);
}