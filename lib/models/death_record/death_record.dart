import 'package:freezed_annotation/freezed_annotation.dart';

import '../animal/animal.dart';

part 'death_record.freezed.dart';
part 'death_record.g.dart';

@freezed
abstract class DeathRecord with _$DeathRecord {
  const factory DeathRecord({
    required String id,
    required String animalId,
    required int dateUtc,
    required String cause,
    required String breed,
    required Gender gender,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _DeathRecord;

  factory DeathRecord.fromJson(Map<String, dynamic> json) =>
      _$DeathRecordFromJson(json);
}

extension DeathRecordSyncPayload on DeathRecord {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'animalId': animalId,
    'dateUtc': dateUtc,
    'cause': cause,
    'breed': breed,
    'gender': gender.name,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
