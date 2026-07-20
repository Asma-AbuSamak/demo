enum MedType { vaccine, treatment, checkup }

class MedRecord {
  final String id;
  final String animalId;
  final String date;
  final MedType type;
  final String description;
  final bool synced;

  const MedRecord({
    required this.id,
    required this.animalId,
    required this.date,
    required this.type,
    required this.description,
    this.synced = false,
  });

  factory MedRecord.fromJson(Map<String, dynamic> j) => MedRecord(
        id: j['id'],
        animalId: j['animalId'],
        date: j['date'],
        type: MedType.values.byName(j['type']),
        description: j['description'],
        synced: j['synced'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'animalId': animalId,
        'date': date,
        'type': type.name,
        'description': description,
        'synced': synced,
      };
}