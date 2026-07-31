import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';
part 'animal.g.dart';

enum Gender { male, female }
enum AnimalStatus { healthy, sick, pregnant }
enum Origin { born, purchased }

@freezed
abstract class Animal with _$Animal {
  const factory Animal({
    required String id,                    
    required String farmId,
    required String tagNumber,             
    required Gender gender,
    required String breed,
    required AnimalStatus status,
    required Origin origin,

    int? weightGrams,                      
    int? birthDateUtc,                    
    String? motherId,
    String? fatherId,
    String? vendorId,                      
    int? purchaseDateUtc,
    int? purchasePriceMinor,              
    @Default('JOD') String currency,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _Animal;

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
} 

extension AnimalSyncPayload on Animal {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'farmId': farmId,
    'tagNumber': tagNumber,
    'gender': gender.name,
    'breed': breed,
    'status': status.name,
    'origin': origin.name,
    'weightGrams': weightGrams,
    'birthDateUtc': birthDateUtc,
    'motherId': motherId,
    'fatherId': fatherId,
    'vendorId': vendorId,
    'purchaseDateUtc': purchaseDateUtc,
    'purchasePriceMinor': purchasePriceMinor,
    'currency': currency,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}