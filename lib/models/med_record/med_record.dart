import 'package:freezed_annotation/freezed_annotation.dart';

part 'med_record.freezed.dart';
part 'med_record.g.dart';

enum MedType { vaccine, treatment, checkup }

@freezed
abstract class MedRecord with _$MedRecord {
  const factory MedRecord({
    required String id,
    required String animalId,
    required int dateUtc,
    required MedType type,
    required String description,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _MedRecord;

  factory MedRecord.fromJson(Map<String, dynamic> json) =>
      _$MedRecordFromJson(json);
}

extension MedRecordSyncPayload on MedRecord {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'animalId': animalId,
    'dateUtc': dateUtc,
    'type': type.name,
    'description': description,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
