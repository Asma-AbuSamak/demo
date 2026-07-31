// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicineLogImpl _$$MedicineLogImplFromJson(Map<String, dynamic> json) =>
    _$MedicineLogImpl(
      id: json['id'] as String,
      medicineId: json['medicineId'] as String,
      dateUtc: (json['dateUtc'] as num).toInt(),
      type: $enumDecode(_$MedicineLogTypeEnumMap, json['type']),
      quantity: (json['quantity'] as num).toInt(),
      note: json['note'] as String,
      vendorId: json['vendorId'] as String?,
      purchasePriceMinor: (json['purchasePriceMinor'] as num?)?.toInt(),
      batchExpiryDateUtc: (json['batchExpiryDateUtc'] as num?)?.toInt(),
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MedicineLogImplToJson(_$MedicineLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicineId': instance.medicineId,
      'dateUtc': instance.dateUtc,
      'type': _$MedicineLogTypeEnumMap[instance.type]!,
      'quantity': instance.quantity,
      'note': instance.note,
      'vendorId': instance.vendorId,
      'purchasePriceMinor': instance.purchasePriceMinor,
      'batchExpiryDateUtc': instance.batchExpiryDateUtc,
      'createdAtUtc': instance.createdAtUtc,
      'updatedAtUtc': instance.updatedAtUtc,
      'createdByUserId': instance.createdByUserId,
      'updatedByUserId': instance.updatedByUserId,
      'rowVersion': instance.rowVersion,
      'isDeleted': instance.isDeleted,
      'syncStatus': instance.syncStatus,
      'lastSyncedAtUtc': instance.lastSyncedAtUtc,
    };

const _$MedicineLogTypeEnumMap = {
  MedicineLogType.add: 'add',
  MedicineLogType.remove: 'remove',
};
