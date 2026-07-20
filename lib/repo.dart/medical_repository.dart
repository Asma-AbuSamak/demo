import '../models/weight_record.dart';
import '../models/med_record.dart';
import '../models/vaccine_protocol.dart';

abstract class IMedicalRepository {
  // Weight Records
  Future<List<WeightRecord>> getWeights();
  Future<List<WeightRecord>> getWeightsFor(String animalId);
  Future<void> addWeight(WeightRecord r);

  // Med Records
  Future<List<MedRecord>> getMedRecords();
  Future<List<MedRecord>> getMedRecordsFor(String animalId);
  Future<void> addMedRecord(MedRecord r);

  // Vaccine Protocols
  Future<List<VaccineProtocol>> getProtocols();
  Future<void> addProtocol(VaccineProtocol p);
  Future<void> updateProtocol(VaccineProtocol p);
  Future<void> deleteProtocol(String id);
}