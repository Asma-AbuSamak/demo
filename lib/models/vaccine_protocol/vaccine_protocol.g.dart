// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineProtocolImpl _$$VaccineProtocolImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineProtocolImpl(
      id: json['id'] as String,
      type: $enumDecode(_$ProtocolTypeEnumMap, json['type']),
      name: json['name'] as String,
      schedule: json['schedule'] as String?,
      diseaseType: json['diseaseType'] as String?,
      dosageInterval: json['dosageInterval'] as String?,
      lastDateUtc: (json['lastDateUtc'] as num?)?.toInt(),
      nextDateUtc: (json['nextDateUtc'] as num?)?.toInt(),
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VaccineProtocolImplToJson(
        _$VaccineProtocolImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ProtocolTypeEnumMap[instance.type]!,
      'name': instance.name,
      'schedule': instance.schedule,
      'diseaseType': instance.diseaseType,
      'dosageInterval': instance.dosageInterval,
      'lastDateUtc': instance.lastDateUtc,
      'nextDateUtc': instance.nextDateUtc,
      'createdAtUtc': instance.createdAtUtc,
      'updatedAtUtc': instance.updatedAtUtc,
      'createdByUserId': instance.createdByUserId,
      'updatedByUserId': instance.updatedByUserId,
      'rowVersion': instance.rowVersion,
      'isDeleted': instance.isDeleted,
      'syncStatus': instance.syncStatus,
      'lastSyncedAtUtc': instance.lastSyncedAtUtc,
    };

const _$ProtocolTypeEnumMap = {
  ProtocolType.vaccine: 'vaccine',
  ProtocolType.treatment: 'treatment',
};
