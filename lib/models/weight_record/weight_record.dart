import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_record.freezed.dart';
part 'weight_record.g.dart';

@freezed
abstract class WeightRecord with _$WeightRecord {
  const factory WeightRecord({
    required String id,
    required String animalId,
    required int dateUtc,
    required double weight,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _WeightRecord;

  factory WeightRecord.fromJson(Map<String, dynamic> json) =>
      _$WeightRecordFromJson(json);
}

extension WeightRecordSyncPayload on WeightRecord {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'animalId': animalId,
    'dateUtc': dateUtc,
    'weight': weight,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
