import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine.freezed.dart';
part 'medicine.g.dart';

@freezed
abstract class Medicine with _$Medicine {
  const factory Medicine({
    required String id,
    required String name,
    required int quantity,
    required String unit,
    required int expiryDateUtc,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _Medicine;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
}

extension MedicineSyncPayload on Medicine {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'name': name,
    'quantity': quantity,
    'unit': unit,
    'expiryDateUtc': expiryDateUtc,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
