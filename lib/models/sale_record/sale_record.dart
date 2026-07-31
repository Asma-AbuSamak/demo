import 'package:freezed_annotation/freezed_annotation.dart';

import '../animal/animal.dart';

part 'sale_record.freezed.dart';
part 'sale_record.g.dart';

@freezed
abstract class SaleRecord with _$SaleRecord {
  const factory SaleRecord({
    required String id,
    required String animalId,
    required int dateUtc,
    required int salePriceMinor,
    required String breed,
    required Gender gender,
    int? purchasePriceMinor,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _SaleRecord;

  factory SaleRecord.fromJson(Map<String, dynamic> json) =>
      _$SaleRecordFromJson(json);
}

extension SaleRecordSyncPayload on SaleRecord {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'animalId': animalId,
    'dateUtc': dateUtc,
    'salePriceMinor': salePriceMinor,
    'breed': breed,
    'gender': gender.name,
    'purchasePriceMinor': purchasePriceMinor,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
