enum MedicineLogType { add, remove }

class MedicineLog {
  final String id;
  final String medicineId;
  final String date;
  final MedicineLogType type;
  final int quantity;
  final String note;
  final String? vendorId;
  final double? purchasePrice;
  final String? batchExpiryDate;

  const MedicineLog({
    required this.id,
    required this.medicineId,
    required this.date,
    required this.type,
    required this.quantity,
    required this.note,
    this.vendorId,
    this.purchasePrice,
    this.batchExpiryDate,
  });

  factory MedicineLog.fromJson(Map<String, dynamic> j) => MedicineLog(
        id: j['id'],
        medicineId: j['medicineId'],
        date: j['date'],
        type: MedicineLogType.values.byName(j['type']),
        quantity: j['quantity'],
        note: j['note'],
        vendorId: j['vendorId'],
        purchasePrice: (j['purchasePrice'] as num?)?.toDouble(),
        batchExpiryDate: j['batchExpiryDate'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'medicineId': medicineId,
        'date': date,
        'type': type.name,
        'quantity': quantity,
        'note': note,
        'vendorId': vendorId,
        'purchasePrice': purchasePrice,
        'batchExpiryDate': batchExpiryDate,
      };
}