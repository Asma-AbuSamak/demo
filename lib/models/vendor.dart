class Vendor {
  final String id;
  final String name;
  final String phone;
  final String specialty;
  final String address;

  const Vendor({
    required this.id,
    required this.name,
    required this.phone,
    required this.specialty,
    required this.address,
  });

  factory Vendor.fromJson(Map<String, dynamic> j) => Vendor(
        id: j['id'],
        name: j['name'],
        phone: j['phone'],
        specialty: j['specialty'],
        address: j['address'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'specialty': specialty,
        'address': address,
      };

  Vendor copyWith({String? name, String? phone, String? specialty, String? address}) =>
      Vendor(
        id: id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        specialty: specialty ?? this.specialty,
        address: address ?? this.address,
      );
}