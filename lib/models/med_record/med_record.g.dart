// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'med_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedRecordImpl _$$MedRecordImplFromJson(Map<String, dynamic> json) =>
    _$MedRecordImpl(
      id: json['id'] as String,
      animalId: json['animalId'] as String,
      dateUtc: (json['dateUtc'] as num).toInt(),
      type: $enumDecode(_$MedTypeEnumMap, json['type']),
      description: json['description'] as String,
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MedRecordImplToJson(_$MedRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'animalId': instance.animalId,
      'dateUtc': instance.dateUtc,
      'type': _$MedTypeEnumMap[instance.type]!,
      'description': instance.description,
      'createdAtUtc': instance.createdAtUtc,
      'updatedAtUtc': instance.updatedAtUtc,
      'createdByUserId': instance.createdByUserId,
      'updatedByUserId': instance.updatedByUserId,
      'rowVersion': instance.rowVersion,
      'isDeleted': instance.isDeleted,
      'syncStatus': instance.syncStatus,
      'lastSyncedAtUtc': instance.lastSyncedAtUtc,
    };

const _$MedTypeEnumMap = {
  MedType.vaccine: 'vaccine',
  MedType.treatment: 'treatment',
  MedType.checkup: 'checkup',
};
