enum ProtocolType { vaccine, treatment }

class VaccineProtocol {
  final String id;
  final ProtocolType type;
  final String name;
  final String? schedule;      // annual | 6months | 2months | once
  final String? diseaseType;
  final String? dosageInterval;
  final String? lastDate;
  final String? nextDate;

  const VaccineProtocol({
    required this.id,
    required this.type,
    required this.name,
    this.schedule,
    this.diseaseType,
    this.dosageInterval,
    this.lastDate,
    this.nextDate,
  });

  factory VaccineProtocol.fromJson(Map<String, dynamic> j) => VaccineProtocol(
        id: j['id'],
        type: ProtocolType.values.byName(j['type']),
        name: j['name'],
        schedule: j['schedule'],
        diseaseType: j['diseaseType'],
        dosageInterval: j['dosageInterval'],
        lastDate: j['lastDate'],
        nextDate: j['nextDate'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'name': name,
        'schedule': schedule,
        'diseaseType': diseaseType,
        'dosageInterval': dosageInterval,
        'lastDate': lastDate,
        'nextDate': nextDate,
      };
VaccineProtocol copyWith({
    String? name,
    String? schedule,
    String? diseaseType,
    String? dosageInterval,
    String? lastDate,
    String? nextDate,
  }) =>
      VaccineProtocol(
        id: id,
        type: type,
        name: name ?? this.name,
        schedule: schedule ?? this.schedule,
        diseaseType: diseaseType ?? this.diseaseType,
        dosageInterval: dosageInterval ?? this.dosageInterval,
        lastDate: lastDate ?? this.lastDate,
        nextDate: nextDate ?? this.nextDate,
      );
}