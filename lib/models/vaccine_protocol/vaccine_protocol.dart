import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_protocol.freezed.dart';
part 'vaccine_protocol.g.dart';

enum ProtocolType { vaccine, treatment }

@freezed
abstract class VaccineProtocol with _$VaccineProtocol {
  const factory VaccineProtocol({
    required String id,
    required ProtocolType type,
    required String name,
    String? schedule, // annual | 6months | 2months | once
    String? diseaseType,
    String? dosageInterval,
    int? lastDateUtc,
    int? nextDateUtc,

    required int createdAtUtc,
    required int updatedAtUtc,
    String? createdByUserId,
    String? updatedByUserId,
    @Default(0) int rowVersion,
    @Default(false) bool isDeleted,
    @Default('pending') String syncStatus,
    int? lastSyncedAtUtc,
  }) = _VaccineProtocol;

  factory VaccineProtocol.fromJson(Map<String, dynamic> json) =>
      _$VaccineProtocolFromJson(json);
}

extension VaccineProtocolSyncPayload on VaccineProtocol {
  Map<String, dynamic> toSyncPayload() => {
    'id': id,
    'type': type.name,
    'name': name,
    'schedule': schedule,
    'diseaseType': diseaseType,
    'dosageInterval': dosageInterval,
    'lastDateUtc': lastDateUtc,
    'nextDateUtc': nextDateUtc,
    'createdAtUtc': createdAtUtc,
    'updatedAtUtc': updatedAtUtc,
    'createdByUserId': createdByUserId,
    'updatedByUserId': updatedByUserId,
    'rowVersion': rowVersion,
    'isDeleted': isDeleted,
  };
}
