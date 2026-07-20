class Medicine {
  final String id;
  final String name;
  final int quantity;
  final String unit;
  final String expiryDate;

  const Medicine({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.expiryDate,
  });

  factory Medicine.fromJson(Map<String, dynamic> j) => Medicine(
        id: j['id'],
        name: j['name'],
        quantity: j['quantity'],
        unit: j['unit'],
        expiryDate: j['expiryDate'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'unit': unit,
        'expiryDate': expiryDate,
      };

  Medicine copyWith({int? quantity, String? name, String? unit, String? expiryDate}) =>
      Medicine(
        id: id,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        expiryDate: expiryDate ?? this.expiryDate,
      );
}