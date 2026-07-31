// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicineImpl _$$MedicineImplFromJson(Map<String, dynamic> json) =>
    _$MedicineImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      expiryDateUtc: (json['expiryDateUtc'] as num).toInt(),
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MedicineImplToJson(_$MedicineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'expiryDateUtc': instance.expiryDateUtc,
      'createdAtUtc': instance.createdAtUtc,
      'updatedAtUtc': instance.updatedAtUtc,
      'createdByUserId': instance.createdByUserId,
      'updatedByUserId': instance.updatedByUserId,
      'rowVersion': instance.rowVersion,
      'isDeleted': instance.isDeleted,
      'syncStatus': instance.syncStatus,
      'lastSyncedAtUtc': instance.lastSyncedAtUtc,
    };
