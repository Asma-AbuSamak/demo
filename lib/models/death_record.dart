import 'animal.dart';

class DeathRecord {
  final String id;
  final String animalId;
  final String date;
  final String cause;
  final String breed;
  final Gender gender;

  const DeathRecord({
    required this.id,
    required this.animalId,
    required this.date,
    required this.cause,
    required this.breed,
    required this.gender,
  });

  factory DeathRecord.fromJson(Map<String, dynamic> j) => DeathRecord(
        id: j['id'],
        animalId: j['animalId'],
        date: j['date'],
        cause: j['cause'],
        breed: j['breed'],
        gender: Gender.values.byName(j['gender']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'animalId': animalId,
        'date': date,
        'cause': cause,
        'breed': breed,
        'gender': gender.name,
      };
}