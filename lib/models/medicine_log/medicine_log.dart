import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_log.freezed.dart';
part 'medicine_log.g.dart';

enum MedicineLogType { add, remove }

@freezed
abstract class MedicineLog with _$MedicineLog {
  const factory MedicineLog({
    required String id,
    required String medicineId,
    required int dateUtc,
    required MedicineLogType type,
    required int quantity,
    required String note,
    String? vendorId,
    int? purchasePriceMinor,
    int? batchExpiryDateUtc,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _MedicineLog;

  factory MedicineLog.fromJson(Map<String, dynamic> json) =>
      _$MedicineLogFromJson(json);
}

extension MedicineLogSyncPayload on MedicineLog {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'medicineId': medicineId,
    'dateUtc': dateUtc,
    'type': type.name,
    'quantity': quantity,
    'note': note,
    'vendorId': vendorId,
    'purchasePriceMinor': purchasePriceMinor,
    'batchExpiryDateUtc': batchExpiryDateUtc,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
