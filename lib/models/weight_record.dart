class WeightRecord {
  final String id;
  final String animalId;
  final String date;
  final double weight;
  final bool synced;

  const WeightRecord({
    required this.id,
    required this.animalId,
    required this.date,
    required this.weight,
    this.synced = false,
  });

  factory WeightRecord.fromJson(Map<String, dynamic> j) => WeightRecord(
        id: j['id'],
        animalId: j['animalId'],
        date: j['date'],
        weight: (j['weight'] as num).toDouble(),
        synced: j['synced'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'animalId': animalId,
        'date': date,
        'weight': weight,
        'synced': synced,
      };
}