// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeding_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreedingRecordImpl _$$BreedingRecordImplFromJson(Map<String, dynamic> json) =>
    _$BreedingRecordImpl(
      id: json['id'] as String,
      femaleId: json['femaleId'] as String,
      maleId: json['maleId'] as String,
      dateUtc: (json['dateUtc'] as num).toInt(),
      status: $enumDecode(_$BreedingStatusEnumMap, json['status']),
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BreedingRecordImplToJson(
        _$BreedingRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'femaleId': instance.femaleId,
      'maleId': instance.maleId,
      'dateUtc': instance.dateUtc,
      'status': _$BreedingStatusEnumMap[instance.status]!,
      'createdAtUtc': instance.createdAtUtc,
      'updatedAtUtc': instance.updatedAtUtc,
      'createdByUserId': instance.createdByUserId,
      'updatedByUserId': instance.updatedByUserId,
      'rowVersion': instance.rowVersion,
      'isDeleted': instance.isDeleted,
      'syncStatus': instance.syncStatus,
      'lastSyncedAtUtc': instance.lastSyncedAtUtc,
    };

const _$BreedingStatusEnumMap = {
  BreedingStatus.active: 'active',
  BreedingStatus.completed: 'completed',
};
