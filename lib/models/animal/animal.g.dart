// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimalImpl _$$AnimalImplFromJson(Map<String, dynamic> json) => _$AnimalImpl(
      id: json['id'] as String,
      farmId: json['farmId'] as String,
      tagNumber: json['tagNumber'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      breed: json['breed'] as String,
      status: $enumDecode(_$AnimalStatusEnumMap, json['status']),
      origin: $enumDecode(_$OriginEnumMap, json['origin']),
      weightGrams: (json['weightGrams'] as num?)?.toInt(),
      birthDateUtc: (json['birthDateUtc'] as num?)?.toInt(),
      motherId: json['motherId'] as String?,
      fatherId: json['fatherId'] as String?,
      vendorId: json['vendorId'] as String?,
      purchaseDateUtc: (json['purchaseDateUtc'] as num?)?.toInt(),
      purchasePriceMinor: (json['purchasePriceMinor'] as num?)?.toInt(),
      currency: json['currency'] as String? ?? 'JOD',
      createdAtUtc: (json['createdAtUtc'] as num).toInt(),
      updatedAtUtc: (json['updatedAtUtc'] as num).toInt(),
      createdByUserId: json['createdByUserId'] as String?,
      updatedByUserId: json['updatedByUserId'] as String?,
      rowVersion: (json['rowVersion'] as num?)?.toInt() ?? 0,
      isDeleted: json['isDeleted'] as bool? ?? false,
      syncStatus: json['syncStatus'] as String? ?? 'pending',
      lastSyncedAtUtc: (json['lastSyncedAtUtc'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AnimalImplToJson(_$AnimalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'farmId': instance.farmId,
      'tagNumber': instance.tagNumber,
      'gender': _$GenderEnumMap[instance.gender]!,
      'breed': instance.breed,
      'status': _$AnimalStatusEnumMap[instance.status]!,
      'origin': _$OriginEnumMap[instance.origin]!,
      'weightGrams': instance.weightGrams,
      'birthDateUtc': instance.birthDateUtc,
      'motherId': instance.motherId,
      'fatherId': instance.fatherId,
      'vendorId': instance.vendorId,
      'purchaseDateUtc': instance.purchaseDateUtc,
      'purchasePriceMinor': instance.purchasePriceMinor,
      'currency': instance.currency,
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

const _$AnimalStatusEnumMap = {
  AnimalStatus.healthy: 'healthy',
  AnimalStatus.sick: 'sick',
  AnimalStatus.pregnant: 'pregnant',
};

const _$OriginEnumMap = {
  Origin.born: 'born',
  Origin.purchased: 'purchased',
};
