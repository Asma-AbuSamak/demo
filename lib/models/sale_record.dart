import 'animal.dart';

class SaleRecord {
  final String id;
  final String animalId;
  final String date;
  final double salePrice;
  final String breed;
  final Gender gender;
  final double? purchasePrice;

  const SaleRecord({
    required this.id,
    required this.animalId,
    required this.date,
    required this.salePrice,
    required this.breed,
    required this.gender,
    this.purchasePrice,
  });

  factory SaleRecord.fromJson(Map<String, dynamic> j) => SaleRecord(
        id: j['id'],
        animalId: j['animalId'],
        date: j['date'],
        salePrice: (j['salePrice'] as num).toDouble(),
        breed: j['breed'],
        gender: Gender.values.byName(j['gender']),
        purchasePrice: (j['purchasePrice'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'animalId': animalId,
        'date': date,
        'salePrice': salePrice,
        'breed': breed,
        'gender': gender.name,
        'purchasePrice': purchasePrice,
      };
}