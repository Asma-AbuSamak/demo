enum BreedingStatus { active, completed }

class BreedingRecord {
  final String id;
  final String femaleId;
  final String maleId;
  final String date;
  final BreedingStatus status;

  const BreedingRecord({
    required this.id,
    required this.femaleId,
    required this.maleId,
    required this.date,
    required this.status,
  });

  factory BreedingRecord.fromJson(Map<String, dynamic> j) => BreedingRecord(
        id: j['id'],
        femaleId: j['femaleId'],
        maleId: j['maleId'],
        date: j['date'],
        status: BreedingStatus.values.byName(j['status']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'femaleId': femaleId,
        'maleId': maleId,
        'date': date,
        'status': status.name,
      };

  BreedingRecord copyWith({BreedingStatus? status}) => BreedingRecord(
        id: id,
        femaleId: femaleId,
        maleId: maleId,
        date: date,
        status: status ?? this.status,
      );
}