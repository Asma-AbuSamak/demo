import 'package:insighta/models/medicine/medicine.dart';
import '../models/animal/animal.dart';
import '../models/weight_record/weight_record.dart';
import '../models/med_record/med_record.dart';
import '../models/vendor/vendor.dart';
import '../models/medicine_log/medicine_log.dart';
import '../models/breeding_record/breeding_record.dart';
import '../models/vaccine_protocol/vaccine_protocol.dart';

const _seededCreatedAtUtc = 1704067200000; // 2024-01-01 UTC — fixed so mock lists stay const
const _seededUpdatedAtUtc = 1704067200000;

class MockData {
  static List<Animal> animals() => [
        const Animal(id: 'RF-001', farmId: 'f1', tagNumber: 'RF-001', gender: Gender.female, breed: 'نجدي', birthDateUtc: 1647302400000, status: AnimalStatus.healthy, weightGrams: 52000, origin: Origin.born, motherId: 'RF-006', fatherId: 'RF-004', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-002', farmId: 'f1', tagNumber: 'RF-002', gender: Gender.female, breed: 'نعيمي', birthDateUtc: 1673308800000, status: AnimalStatus.pregnant, weightGrams: 48000, origin: Origin.born, motherId: 'RF-006', fatherId: 'RF-009', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-003', farmId: 'f1', tagNumber: 'RF-003', gender: Gender.female, breed: 'نجدي', birthDateUtc: 1626739200000, status: AnimalStatus.sick, weightGrams: 44000, origin: Origin.born, motherId: 'RF-008', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-004', farmId: 'f1', tagNumber: 'RF-004', gender: Gender.male, breed: 'نعيمي', birthDateUtc: 1662336000000, status: AnimalStatus.healthy, weightGrams: 78000, origin: Origin.purchased, vendorId: 'v1', purchaseDateUtc: 1673308800000, purchasePriceMinor: 280000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-005', farmId: 'f1', tagNumber: 'RF-005', gender: Gender.male, breed: 'حجازي', birthDateUtc: 1681257600000, status: AnimalStatus.healthy, weightGrams: 65000, origin: Origin.born, motherId: 'RF-003', fatherId: 'RF-004', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-006', farmId: 'f1', tagNumber: 'RF-006', gender: Gender.female, breed: 'نجدي', birthDateUtc: 1606694400000, status: AnimalStatus.healthy, weightGrams: 55000, origin: Origin.born, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-007', farmId: 'f1', tagNumber: 'RF-007', gender: Gender.male, breed: 'نعيمي', birthDateUtc: 1687046400000, status: AnimalStatus.healthy, weightGrams: 70000, origin: Origin.purchased, vendorId: 'v3', purchaseDateUtc: 1688169600000, purchasePriceMinor: 220000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-008', farmId: 'f1', tagNumber: 'RF-008', gender: Gender.female, breed: 'حجازي', birthDateUtc: 1644278400000, status: AnimalStatus.healthy, weightGrams: 50000, origin: Origin.born, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-009', farmId: 'f1', tagNumber: 'RF-009', gender: Gender.male, breed: 'نجدي', birthDateUtc: 1638316800000, status: AnimalStatus.healthy, weightGrams: 82000, origin: Origin.born, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Animal(id: 'RF-010', farmId: 'f1', tagNumber: 'RF-010', gender: Gender.female, breed: 'نعيمي', birthDateUtc: 1692662400000, status: AnimalStatus.healthy, weightGrams: 41000, origin: Origin.purchased, vendorId: 'v1', purchaseDateUtc: 1707955200000, purchasePriceMinor: 150000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];

  static List<WeightRecord> weights() => [
        const WeightRecord(id: 'w1', animalId: 'RF-001', dateUtc: 1746057600000, weight: 48, syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const WeightRecord(id: 'w2', animalId: 'RF-001', dateUtc: 1748736000000, weight: 50, syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const WeightRecord(id: 'w3', animalId: 'RF-001', dateUtc: 1751328000000, weight: 52, syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const WeightRecord(id: 'w4', animalId: 'RF-004', dateUtc: 1744675200000, weight: 72, syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const WeightRecord(id: 'w5', animalId: 'RF-004', dateUtc: 1749945600000, weight: 75, syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const WeightRecord(id: 'w6', animalId: 'RF-004', dateUtc: 1752105600000, weight: 78, syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const WeightRecord(id: 'w7', animalId: 'RF-003', dateUtc: 1750377600000, weight: 46, syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const WeightRecord(id: 'w8', animalId: 'RF-003', dateUtc: 1752105600000, weight: 44, syncStatus: 'pending', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];

  static List<MedRecord> medRecords() => [
        const MedRecord(id: 'm1', animalId: 'RF-001', dateUtc: 1749513600000, type: MedType.vaccine, description: 'تطعيم الحمى القلاعية', syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm2', animalId: 'RF-001', dateUtc: 1741996800000, type: MedType.checkup, description: 'فحص دوري – الحالة ممتازة', syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm3', animalId: 'RF-002', dateUtc: 1751328000000, type: MedType.checkup, description: 'فحص الحمل – الأسبوع الثاني عشر', syncStatus: 'pending', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm4', animalId: 'RF-003', dateUtc: 1752105600000, type: MedType.treatment, description: 'إيفرمكتين 1% – علاج طفيليات خارجية', syncStatus: 'pending', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm5', animalId: 'RF-003', dateUtc: 1752278400000, type: MedType.treatment, description: 'أموكسيسيلين – جرعة ثانية', syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm6', animalId: 'RF-004', dateUtc: 1747699200000, type: MedType.vaccine, description: 'تطعيم الجدري – جرعة منشطة', syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm7', animalId: 'RF-005', dateUtc: 1751241600000, type: MedType.checkup, description: 'فحص دوري – نتائج طبيعية', syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm8', animalId: 'RF-004', dateUtc: 1749513600000, type: MedType.vaccine, description: 'تطعيم الحمى القلاعية', syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedRecord(id: 'm9', animalId: 'RF-006', dateUtc: 1749513600000, type: MedType.vaccine, description: 'تطعيم الحمى القلاعية', syncStatus: 'synced', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];

  static List<Medicine> medicines() => [
        const Medicine(id: 'md1', name: 'أوكسي تتراسيكلين 20%', quantity: 12, unit: 'زجاجة', expiryDateUtc: 1785542400000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Medicine(id: 'md2', name: 'فيتامين E + سيلينيوم', quantity: 5, unit: 'زجاجة', expiryDateUtc: 1757894400000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Medicine(id: 'md3', name: 'إيفرمكتين 1%', quantity: 8, unit: 'زجاجة', expiryDateUtc: 1773964800000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Medicine(id: 'md4', name: 'لقاح الحمى القلاعية', quantity: 3, unit: 'علبة', expiryDateUtc: 1753920000000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Medicine(id: 'md5', name: 'دكساميثازون', quantity: 6, unit: 'زجاجة', expiryDateUtc: 1796083200000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Medicine(id: 'md6', name: 'بنسلين G', quantity: 0, unit: 'علبة', expiryDateUtc: 1751241600000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Medicine(id: 'md7', name: 'كالسيوم بوروغلوكونيت', quantity: 10, unit: 'زجاجة', expiryDateUtc: 1799971200000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];

  static List<Vendor> vendors() => [
        const Vendor(id: 'v1', name: 'صيدلية بيطرية الرياض', phone: '+966 50 123 4567', specialty: 'أدوية وتطعيمات', address: 'الرياض، حي العليا', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Vendor(id: 'v2', name: 'د. محمد الحربي', phone: '+966 55 987 6543', specialty: 'طب بيطري وجراحة', address: 'الرياض، حي النزهة', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const Vendor(id: 'v3', name: 'مزرعة الخليج للأعلاف', phone: '+966 56 456 7890', specialty: 'أعلاف ومستلزمات', address: 'الخرج، طريق الملك فهد', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];

  static List<MedicineLog> medLogs() => [
        const MedicineLog(id: 'ml1', medicineId: 'md1', dateUtc: 1735689600000, type: MedicineLogType.add, quantity: 12, note: 'رصيد افتتاحي', purchasePriceMinor: 8500, vendorId: 'v1', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedicineLog(id: 'ml2', medicineId: 'md3', dateUtc: 1749945600000, type: MedicineLogType.add, quantity: 10, note: 'طلبية جديدة', purchasePriceMinor: 12000, vendorId: 'v1', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedicineLog(id: 'ml3', medicineId: 'md3', dateUtc: 1752105600000, type: MedicineLogType.remove, quantity: 2, note: 'استخدام RF-003', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const MedicineLog(id: 'ml4', medicineId: 'md2', dateUtc: 1735689600000, type: MedicineLogType.add, quantity: 5, note: 'رصيد افتتاحي', purchasePriceMinor: 15000, vendorId: 'v1', createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];

  static List<BreedingRecord> breedings() => [
        const BreedingRecord(id: 'br1', femaleId: 'RF-002', maleId: 'RF-004', dateUtc: 1740787200000, status: BreedingStatus.active, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];

  static List<VaccineProtocol> protocols() => [
        const VaccineProtocol(id: 'p1', type: ProtocolType.vaccine, name: 'تطعيم الحمى القلاعية', schedule: 'annual', lastDateUtc: 1749513600000, nextDateUtc: 1781049600000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const VaccineProtocol(id: 'p2', type: ProtocolType.vaccine, name: 'تطعيم الجدري', schedule: 'annual', lastDateUtc: 1747699200000, nextDateUtc: 1779235200000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
        const VaccineProtocol(id: 'p3', type: ProtocolType.treatment, name: 'إيفرمكتين 1%', diseaseType: 'طفيليات خارجية', dosageInterval: 'كل 6 أشهر', lastDateUtc: 1752105600000, nextDateUtc: 1768003200000, createdAtUtc: _seededCreatedAtUtc, updatedAtUtc: _seededUpdatedAtUtc),
      ];
}
