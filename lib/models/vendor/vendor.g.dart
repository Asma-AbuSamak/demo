// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorImpl _$$VendorImplFromJson(Map<String, dynamic> json) => _$VendorImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      specialty: json['specialty'] as String,
      address: json['address'] as String,
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VendorImplToJson(_$VendorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'specialty': instance.specialty,
      'address': instance.address,
      'createdAtUtc': instance.createdAtUtc,
      'updatedAtUtc': instance.updatedAtUtc,
      'createdByUserId': instance.createdByUserId,
      'updatedByUserId': instance.updatedByUserId,
      'rowVersion': instance.rowVersion,
      'isDeleted': instance.isDeleted,
      'syncStatus': instance.syncStatus,
      'lastSyncedAtUtc': instance.lastSyncedAtUtc,
    };
