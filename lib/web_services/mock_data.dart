import 'package:insighta/models/midicine.dart';
import '../models/animal.dart';
import '../models/weight_record.dart';
import '../models/med_record.dart';
import '../models/vendor.dart';
import '../models/medicine_log.dart';
import '../models/breeding_record.dart';
import '../models/vaccine_protocol.dart';


class MockData {
  static List<Animal> animals() => [
        const Animal(id: 'RF-001', gender: Gender.female, breed: 'نجدي', birthDate: '2022-03-15', status: AnimalStatus.healthy, weight: 52, origin: Origin.born, motherId: 'RF-006', fatherId: 'RF-004'),
        const Animal(id: 'RF-002', gender: Gender.female, breed: 'نعيمي', birthDate: '2023-01-10', status: AnimalStatus.pregnant, weight: 48, origin: Origin.born, motherId: 'RF-006', fatherId: 'RF-009'),
        const Animal(id: 'RF-003', gender: Gender.female, breed: 'نجدي', birthDate: '2021-07-20', status: AnimalStatus.sick, weight: 44, origin: Origin.born, motherId: 'RF-008'),
        const Animal(id: 'RF-004', gender: Gender.male, breed: 'نعيمي', birthDate: '2022-09-05', status: AnimalStatus.healthy, weight: 78, origin: Origin.purchased, vendorName: 'سوق الماشية', purchaseDate: '2023-01-10', purchasePrice: '2800'),
        const Animal(id: 'RF-005', gender: Gender.male, breed: 'حجازي', birthDate: '2023-04-12', status: AnimalStatus.healthy, weight: 65, origin: Origin.born, motherId: 'RF-003', fatherId: 'RF-004'),
        const Animal(id: 'RF-006', gender: Gender.female, breed: 'نجدي', birthDate: '2020-11-30', status: AnimalStatus.healthy, weight: 55, origin: Origin.born),
        const Animal(id: 'RF-007', gender: Gender.male, breed: 'نعيمي', birthDate: '2023-06-18', status: AnimalStatus.healthy, weight: 70, origin: Origin.purchased, vendorName: 'مزرعة الربوة', purchaseDate: '2023-07-01', purchasePrice: '2200'),
        const Animal(id: 'RF-008', gender: Gender.female, breed: 'حجازي', birthDate: '2022-02-08', status: AnimalStatus.healthy, weight: 50, origin: Origin.born),
        const Animal(id: 'RF-009', gender: Gender.male, breed: 'نجدي', birthDate: '2021-12-01', status: AnimalStatus.healthy, weight: 82, origin: Origin.born),
        const Animal(id: 'RF-010', gender: Gender.female, breed: 'نعيمي', birthDate: '2023-08-22', status: AnimalStatus.healthy, weight: 41, origin: Origin.purchased, vendorName: 'سوق الماشية', purchaseDate: '2024-02-15', purchasePrice: '1500'),
      ];

  static List<WeightRecord> weights() => [
        const WeightRecord(id: 'w1', animalId: 'RF-001', date: '2025-05-01', weight: 48, synced: true),
        const WeightRecord(id: 'w2', animalId: 'RF-001', date: '2025-06-01', weight: 50, synced: true),
        const WeightRecord(id: 'w3', animalId: 'RF-001', date: '2025-07-01', weight: 52, synced: true),
        const WeightRecord(id: 'w4', animalId: 'RF-004', date: '2025-04-15', weight: 72, synced: true),
        const WeightRecord(id: 'w5', animalId: 'RF-004', date: '2025-06-15', weight: 75, synced: true),
        const WeightRecord(id: 'w6', animalId: 'RF-004', date: '2025-07-10', weight: 78, synced: true),
        const WeightRecord(id: 'w7', animalId: 'RF-003', date: '2025-06-20', weight: 46, synced: true),
        const WeightRecord(id: 'w8', animalId: 'RF-003', date: '2025-07-10', weight: 44, synced: false),
      ];

  static List<MedRecord> medRecords() => [
        const MedRecord(id: 'm1', animalId: 'RF-001', date: '2025-06-10', type: MedType.vaccine, description: 'تطعيم الحمى القلاعية', synced: true),
        const MedRecord(id: 'm2', animalId: 'RF-001', date: '2025-03-15', type: MedType.checkup, description: 'فحص دوري – الحالة ممتازة', synced: true),
        const MedRecord(id: 'm3', animalId: 'RF-002', date: '2025-07-01', type: MedType.checkup, description: 'فحص الحمل – الأسبوع الثاني عشر', synced: false),
        const MedRecord(id: 'm4', animalId: 'RF-003', date: '2025-07-10', type: MedType.treatment, description: 'إيفرمكتين 1% – علاج طفيليات خارجية', synced: false),
        const MedRecord(id: 'm5', animalId: 'RF-003', date: '2025-07-12', type: MedType.treatment, description: 'أموكسيسيلين – جرعة ثانية', synced: true),
        const MedRecord(id: 'm6', animalId: 'RF-004', date: '2025-05-20', type: MedType.vaccine, description: 'تطعيم الجدري – جرعة منشطة', synced: true),
        const MedRecord(id: 'm7', animalId: 'RF-005', date: '2025-06-30', type: MedType.checkup, description: 'فحص دوري – نتائج طبيعية', synced: true),
        const MedRecord(id: 'm8', animalId: 'RF-004', date: '2025-06-10', type: MedType.vaccine, description: 'تطعيم الحمى القلاعية', synced: true),
        const MedRecord(id: 'm9', animalId: 'RF-006', date: '2025-06-10', type: MedType.vaccine, description: 'تطعيم الحمى القلاعية', synced: true),
      ];

  static List<Medicine> medicines() => [
        const Medicine(id: 'md1', name: 'أوكسي تتراسيكلين 20%', quantity: 12, unit: 'زجاجة', expiryDate: '2026-08-01'),
        const Medicine(id: 'md2', name: 'فيتامين E + سيلينيوم', quantity: 5, unit: 'زجاجة', expiryDate: '2025-09-15'),
        const Medicine(id: 'md3', name: 'إيفرمكتين 1%', quantity: 8, unit: 'زجاجة', expiryDate: '2026-03-20'),
        const Medicine(id: 'md4', name: 'لقاح الحمى القلاعية', quantity: 3, unit: 'علبة', expiryDate: '2025-07-31'),
        const Medicine(id: 'md5', name: 'دكساميثازون', quantity: 6, unit: 'زجاجة', expiryDate: '2026-12-01'),
        const Medicine(id: 'md6', name: 'بنسلين G', quantity: 0, unit: 'علبة', expiryDate: '2025-06-30'),
        const Medicine(id: 'md7', name: 'كالسيوم بوروغلوكونيت', quantity: 10, unit: 'زجاجة', expiryDate: '2027-01-15'),
      ];

  static List<Vendor> vendors() => [
        const Vendor(id: 'v1', name: 'صيدلية بيطرية الرياض', phone: '+966 50 123 4567', specialty: 'أدوية وتطعيمات', address: 'الرياض، حي العليا'),
        const Vendor(id: 'v2', name: 'د. محمد الحربي', phone: '+966 55 987 6543', specialty: 'طب بيطري وجراحة', address: 'الرياض، حي النزهة'),
        const Vendor(id: 'v3', name: 'مزرعة الخليج للأعلاف', phone: '+966 56 456 7890', specialty: 'أعلاف ومستلزمات', address: 'الخرج، طريق الملك فهد'),
      ];

  static List<MedicineLog> medLogs() => [
        const MedicineLog(id: 'ml1', medicineId: 'md1', date: '2025-01-01', type: MedicineLogType.add, quantity: 12, note: 'رصيد افتتاحي', purchasePrice: 85, vendorId: 'v1'),
        const MedicineLog(id: 'ml2', medicineId: 'md3', date: '2025-06-15', type: MedicineLogType.add, quantity: 10, note: 'طلبية جديدة', purchasePrice: 120, vendorId: 'v1'),
        const MedicineLog(id: 'ml3', medicineId: 'md3', date: '2025-07-10', type: MedicineLogType.remove, quantity: 2, note: 'استخدام RF-003'),
        const MedicineLog(id: 'ml4', medicineId: 'md2', date: '2025-01-01', type: MedicineLogType.add, quantity: 5, note: 'رصيد افتتاحي', purchasePrice: 150, vendorId: 'v1'),
      ];

  static List<BreedingRecord> breedings() => [
        const BreedingRecord(id: 'br1', femaleId: 'RF-002', maleId: 'RF-004', date: '2025-03-01', status: BreedingStatus.active),
      ];

  static List<VaccineProtocol> protocols() => [
        const VaccineProtocol(id: 'p1', type: ProtocolType.vaccine, name: 'تطعيم الحمى القلاعية', schedule: 'annual', lastDate: '2025-06-10', nextDate: '2026-06-10'),
        const VaccineProtocol(id: 'p2', type: ProtocolType.vaccine, name: 'تطعيم الجدري', schedule: 'annual', lastDate: '2025-05-20', nextDate: '2026-05-20'),
        const VaccineProtocol(id: 'p3', type: ProtocolType.treatment, name: 'إيفرمكتين 1%', diseaseType: 'طفيليات خارجية', dosageInterval: 'كل 6 أشهر', lastDate: '2025-07-10', nextDate: '2026-01-10'),
      ];
}