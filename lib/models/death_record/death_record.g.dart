// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'death_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeathRecordImpl _$$DeathRecordImplFromJson(Map<String, dynamic> json) =>
    _$DeathRecordImpl(
      id: json['id'] as String,
      animalId: json['animalId'] as String,
      dateUtc: (json['dateUtc'] as num).toInt(),
      cause: json['cause'] as String,
      breed: json['breed'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DeathRecordImplToJson(_$DeathRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'animalId': instance.animalId,
      'dateUtc': instance.dateUtc,
      'cause': instance.cause,
      'breed': instance.breed,
      'gender': _$GenderEnumMap[instance.gender]!,
      'createdAtUtc': instance.createdAtUtc,
      'updatedAtUtc': instance.updatedAtUtc,
      'createdByUserId': instance.createdByUserId,
      'updatedByUserId': instance.updatedByUserId,
      'rowVersion': instance.rowVersion,
      'isDeleted': instance.isDeleted,
      'syncStatus': instance.syncStatus,
      'lastSyncedAtUtc': instance.lastSyncedAtUtc,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
