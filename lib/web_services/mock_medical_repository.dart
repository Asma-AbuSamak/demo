import 'package:insighta/repo.dart/medical_repository.dart';
import '../models/weight_record.dart';
import '../models/med_record.dart';
import '../models/vaccine_protocol.dart';
import 'mock_data.dart';

class MockMedicalRepository implements IMedicalRepository {
  final List<WeightRecord> _weights = MockData.weights();
  final List<MedRecord> _med = MockData.medRecords();
  final List<VaccineProtocol> _protocols = MockData.protocols();

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 300));

  @override
  Future<List<WeightRecord>> getWeights() async {
    await _delay();
    return List.unmodifiable(_weights);
  }

  @override
  Future<List<WeightRecord>> getWeightsFor(String animalId) async {
    await _delay();
    return _weights.where((w) => w.animalId == animalId).toList();
  }

  @override
  Future<void> addWeight(WeightRecord r) async {
    await _delay();
    _weights.add(r);
  }

  @override
  Future<List<MedRecord>> getMedRecords() async {
    await _delay();
    return List.unmodifiable(_med);
  }

  @override
  Future<List<MedRecord>> getMedRecordsFor(String animalId) async {
    await _delay();
    return _med.where((m) => m.animalId == animalId).toList();
  }

  @override
  Future<void> addMedRecord(MedRecord r) async {
    await _delay();
    _med.add(r);
  }

  @override
  Future<List<VaccineProtocol>> getProtocols() async {
    await _delay();
    return List.unmodifiable(_protocols);
  }

  @override
  Future<void> addProtocol(VaccineProtocol p) async {
    await _delay();
    _protocols.add(p);
  }

  @override
  Future<void> updateProtocol(VaccineProtocol p) async {
    await _delay();
    final i = _protocols.indexWhere((x) => x.id == p.id);
    if (i != -1) _protocols[i] = p;
  }

  @override
  Future<void> deleteProtocol(String id) async {
    await _delay();
    _protocols.removeWhere((p) => p.id == id);
  }
}