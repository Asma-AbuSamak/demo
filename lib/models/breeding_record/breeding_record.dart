import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeding_record.freezed.dart';
part 'breeding_record.g.dart';

enum BreedingStatus { active, completed }

@freezed
abstract class BreedingRecord with _$BreedingRecord {
  const factory BreedingRecord({
    required String id,
    required String femaleId,
    required String maleId,
    required int dateUtc,
    required BreedingStatus status,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _BreedingRecord;

  factory BreedingRecord.fromJson(Map<String, dynamic> json) =>
      _$BreedingRecordFromJson(json);
}

extension BreedingRecordSyncPayload on BreedingRecord {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'femaleId': femaleId,
    'maleId': maleId,
    'dateUtc': dateUtc,
    'status': status.name,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
