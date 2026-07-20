enum Gender { male, female }
enum AnimalStatus { healthy, sick, pregnant }
enum Origin { born, purchased }

/// الحيوان يُعرّف بشريحة RFID فقط (RF-001) بلا أسماء.
class Animal {
  final String id;
  final Gender gender;
  final String breed;
  final String birthDate; // ISO: yyyy-MM-dd
  final AnimalStatus status;
  final double weight;
  final Origin origin;
  final String? motherId;
  final String? fatherId;
  final String? vendorName;
  final String? purchaseDate;
  final String? purchasePrice;

  const Animal({
    required this.id,
    required this.gender,
    required this.breed,
    required this.birthDate,
    required this.status,
    required this.weight,
    required this.origin,
    this.motherId,
    this.fatherId,
    this.vendorName,
    this.purchaseDate,
    this.purchasePrice,
  });

  factory Animal.fromJson(Map<String, dynamic> j) => Animal(
        id: j['id'] as String,
        gender: Gender.values.byName(j['gender'] as String),
        breed: j['breed'] as String,
        birthDate: j['birthDate'] as String,
        status: AnimalStatus.values.byName(j['status'] as String),
        weight: (j['weight'] as num).toDouble(),
        origin: Origin.values.byName(j['origin'] as String),
        motherId: j['motherId'] as String?,
        fatherId: j['fatherId'] as String?,
        vendorName: j['vendorName'] as String?,
        purchaseDate: j['purchaseDate'] as String?,
        purchasePrice: j['purchasePrice']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'gender': gender.name,
        'breed': breed,
        'birthDate': birthDate,
        'status': status.name,
        'weight': weight,
        'origin': origin.name,
        'motherId': motherId,
        'fatherId': fatherId,
        'vendorName': vendorName,
        'purchaseDate': purchaseDate,
        'purchasePrice': purchasePrice,
      };

  Animal copyWith({//لتعديل بيانات الحيوان بدون تغيير الكائن الأصلي
    Gender? gender,
    String? breed,
    String? birthDate,
    AnimalStatus? status,
    double? weight,
    Origin? origin,
    String? motherId,
    String? fatherId,
    String? vendorName,
    String? purchaseDate,
    String? purchasePrice,
  }) =>
      Animal(//اذا لم يتم تمرير قيمة جديدة، سيتم الاحتفاظ بالقيمة الحالية
        id: id,//لا يمكن تغيير معرف الحيوان
        gender: gender ?? this.gender,
        breed: breed ?? this.breed,
        birthDate: birthDate ?? this.birthDate,
        status: status ?? this.status,
        weight: weight ?? this.weight,
        origin: origin ?? this.origin,
        motherId: motherId ?? this.motherId,
        fatherId: fatherId ?? this.fatherId,
        vendorName: vendorName ?? this.vendorName,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        purchasePrice: purchasePrice ?? this.purchasePrice,
      );
}