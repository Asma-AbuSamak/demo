import 'package:insighta/models/midicine.dart';
import 'package:insighta/repo.dart/inventory_repository.dart';

import '../models/vendor.dart';
import '../models/medicine_log.dart';
import 'mock_data.dart';

class MockInventoryRepository implements IInventoryRepository {
  final List<Medicine> _medicines = MockData.medicines();
  final List<Vendor> _vendors = MockData.vendors();
  final List<MedicineLog> _logs = MockData.medLogs();

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 300));

  @override
  Future<List<Medicine>> getMedicines() async {
    await _delay();
    return List.unmodifiable(_medicines);
  }

  @override
  Future<void> addMedicine(Medicine m) async {
    await _delay();
    _medicines.add(m);
  }

  @override
  Future<void> updateMedicine(Medicine m) async {
    await _delay();
    final i = _medicines.indexWhere((x) => x.id == m.id);
    if (i != -1) _medicines[i] = m;
  }

  @override
  Future<void> deleteMedicine(String id) async {
    await _delay();
    _medicines.removeWhere((m) => m.id == id);
  }

  @override
  Future<List<Vendor>> getVendors() async {
    await _delay();
    return List.unmodifiable(_vendors);
  }

  @override
  Future<void> addVendor(Vendor v) async {
    await _delay();
    _vendors.add(v);
  }

  @override
  Future<void> updateVendor(Vendor v) async {
    await _delay();
    final i = _vendors.indexWhere((x) => x.id == v.id);
    if (i != -1) _vendors[i] = v;
  }

  @override
  Future<void> deleteVendor(String id) async {
    await _delay();
    _vendors.removeWhere((v) => v.id == id);
  }

  @override
  Future<List<MedicineLog>> getLogs() async {
    await _delay();
    return List.unmodifiable(_logs);
  }

  @override
  Future<List<MedicineLog>> getLogsFor(String medicineId) async {
    await _delay();
    return _logs.where((l) => l.medicineId == medicineId).toList();
  }

  @override
  Future<void> addLog(MedicineLog log) async {
    await _delay();
    _logs.add(log);
  }
}