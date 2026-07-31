// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_protocol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineProtocol _$VaccineProtocolFromJson(Map<String, dynamic> json) {
  return _VaccineProtocol.fromJson(json);
}

/// @nodoc
mixin _$VaccineProtocol {
  String get id => throw _privateConstructorUsedError;
  ProtocolType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get schedule =>
      throw _privateConstructorUsedError; // annual | 6months | 2months | once
  String? get diseaseType => throw _privateConstructorUsedError;
  String? get dosageInterval => throw _privateConstructorUsedError;
  int? get lastDateUtc => throw _privateConstructorUsedError;
  int? get nextDateUtc => throw _privateConstructorUsedError;
  int get createdAtUtc => throw _privateConstructorUsedError;
  int get updatedAtUtc => throw _privateConstructorUsedError;
  String? get createdByUserId => throw _privateConstructorUsedError;
  String? get updatedByUserId => throw _privateConstructorUsedError;
  int get rowVersion => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  int? get lastSyncedAtUtc => throw _privateConstructorUsedError;

  /// Serializes this VaccineProtocol to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineProtocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineProtocolCopyWith<VaccineProtocol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineProtocolCopyWith<$Res> {
  factory $VaccineProtocolCopyWith(
          VaccineProtocol value, $Res Function(VaccineProtocol) then) =
      _$VaccineProtocolCopyWithImpl<$Res, VaccineProtocol>;
  @useResult
  $Res call(
      {String id,
      ProtocolType type,
      String name,
      String? schedule,
      String? diseaseType,
      String? dosageInterval,
      int? lastDateUtc,
      int? nextDateUtc,
      int createdAtUtc,
      int updatedAtUtc,
      String? createdByUserId,
      String? updatedByUserId,
      int rowVersion,
      bool isDeleted,
      String syncStatus,
      int? lastSyncedAtUtc});
}

/// @nodoc
class _$VaccineProtocolCopyWithImpl<$Res, $Val extends VaccineProtocol>
    implements $VaccineProtocolCopyWith<$Res> {
  _$VaccineProtocolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineProtocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? schedule = freezed,
    Object? diseaseType = freezed,
    Object? dosageInterval = freezed,
    Object? lastDateUtc = freezed,
    Object? nextDateUtc = freezed,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProtocolType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      diseaseType: freezed == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as String?,
      dosageInterval: freezed == dosageInterval
          ? _value.dosageInterval
          : dosageInterval // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDateUtc: freezed == lastDateUtc
          ? _value.lastDateUtc
          : lastDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      nextDateUtc: freezed == nextDateUtc
          ? _value.nextDateUtc
          : nextDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAtUtc: null == createdAtUtc
          ? _value.createdAtUtc
          : createdAtUtc // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAtUtc: null == updatedAtUtc
          ? _value.updatedAtUtc
          : updatedAtUtc // ignore: cast_nullable_to_non_nullable
              as int,
      createdByUserId: freezed == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedByUserId: freezed == updatedByUserId
          ? _value.updatedByUserId
          : updatedByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      rowVersion: null == rowVersion
          ? _value.rowVersion
          : rowVersion // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncedAtUtc: freezed == lastSyncedAtUtc
          ? _value.lastSyncedAtUtc
          : lastSyncedAtUtc // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccineProtocolImplCopyWith<$Res>
    implements $VaccineProtocolCopyWith<$Res> {
  factory _$$VaccineProtocolImplCopyWith(_$VaccineProtocolImpl value,
          $Res Function(_$VaccineProtocolImpl) then) =
      __$$VaccineProtocolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ProtocolType type,
      String name,
      String? schedule,
      String? diseaseType,
      String? dosageInterval,
      int? lastDateUtc,
      int? nextDateUtc,
      int createdAtUtc,
      int updatedAtUtc,
      String? createdByUserId,
      String? updatedByUserId,
      int rowVersion,
      bool isDeleted,
      String syncStatus,
      int? lastSyncedAtUtc});
}

/// @nodoc
class __$$VaccineProtocolImplCopyWithImpl<$Res>
    extends _$VaccineProtocolCopyWithImpl<$Res, _$VaccineProtocolImpl>
    implements _$$VaccineProtocolImplCopyWith<$Res> {
  __$$VaccineProtocolImplCopyWithImpl(
      _$VaccineProtocolImpl _value, $Res Function(_$VaccineProtocolImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineProtocol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? schedule = freezed,
    Object? diseaseType = freezed,
    Object? dosageInterval = freezed,
    Object? lastDateUtc = freezed,
    Object? nextDateUtc = freezed,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_$VaccineProtocolImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProtocolType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      diseaseType: freezed == diseaseType
          ? _value.diseaseType
          : diseaseType // ignore: cast_nullable_to_non_nullable
              as String?,
      dosageInterval: freezed == dosageInterval
          ? _value.dosageInterval
          : dosageInterval // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDateUtc: freezed == lastDateUtc
          ? _value.lastDateUtc
          : lastDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      nextDateUtc: freezed == nextDateUtc
          ? _value.nextDateUtc
          : nextDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAtUtc: null == createdAtUtc
          ? _value.createdAtUtc
          : createdAtUtc // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAtUtc: null == updatedAtUtc
          ? _value.updatedAtUtc
          : updatedAtUtc // ignore: cast_nullable_to_non_nullable
              as int,
      createdByUserId: freezed == createdByUserId
          ? _value.createdByUserId
          : createdByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedByUserId: freezed == updatedByUserId
          ? _value.updatedByUserId
          : updatedByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      rowVersion: null == rowVersion
          ? _value.rowVersion
          : rowVersion // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncedAtUtc: freezed == lastSyncedAtUtc
          ? _value.lastSyncedAtUtc
          : lastSyncedAtUtc // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineProtocolImpl implements _VaccineProtocol {
  const _$VaccineProtocolImpl(
      {required this.id,
      required this.type,
      required this.name,
      this.schedule,
      this.diseaseType,
      this.dosageInterval,
      this.lastDateUtc,
      this.nextDateUtc,
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      this.rowVersion = 0,
      this.isDeleted = false,
      this.syncStatus = 'pending',
      this.lastSyncedAtUtc});

  factory _$VaccineProtocolImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineProtocolImplFromJson(json);

  @override
  final String id;
  @override
  final ProtocolType type;
  @override
  final String name;
  @override
  final String? schedule;
// annual | 6months | 2months | once
  @override
  final String? diseaseType;
  @override
  final String? dosageInterval;
  @override
  final int? lastDateUtc;
  @override
  final int? nextDateUtc;
  @override
  final int createdAtUtc;
  @override
  final int updatedAtUtc;
  @override
  final String? createdByUserId;
  @override
  final String? updatedByUserId;
  @override
  @JsonKey()
  final int rowVersion;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  final String syncStatus;
  @override
  final int? lastSyncedAtUtc;

  @override
  String toString() {
    return 'VaccineProtocol(id: $id, type: $type, name: $name, schedule: $schedule, diseaseType: $diseaseType, dosageInterval: $dosageInterval, lastDateUtc: $lastDateUtc, nextDateUtc: $nextDateUtc, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, createdByUserId: $createdByUserId, updatedByUserId: $updatedByUserId, rowVersion: $rowVersion, isDeleted: $isDeleted, syncStatus: $syncStatus, lastSyncedAtUtc: $lastSyncedAtUtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineProtocolImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.diseaseType, diseaseType) ||
                other.diseaseType == diseaseType) &&
            (identical(other.dosageInterval, dosageInterval) ||
                other.dosageInterval == dosageInterval) &&
            (identical(other.lastDateUtc, lastDateUtc) ||
                other.lastDateUtc == lastDateUtc) &&
            (identical(other.nextDateUtc, nextDateUtc) ||
                other.nextDateUtc == nextDateUtc) &&
            (identical(other.createdAtUtc, createdAtUtc) ||
                other.createdAtUtc == createdAtUtc) &&
            (identical(other.updatedAtUtc, updatedAtUtc) ||
                other.updatedAtUtc == updatedAtUtc) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.updatedByUserId, updatedByUserId) ||
                other.updatedByUserId == updatedByUserId) &&
            (identical(other.rowVersion, rowVersion) ||
                other.rowVersion == rowVersion) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.lastSyncedAtUtc, lastSyncedAtUtc) ||
                other.lastSyncedAtUtc == lastSyncedAtUtc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      schedule,
      diseaseType,
      dosageInterval,
      lastDateUtc,
      nextDateUtc,
      createdAtUtc,
      updatedAtUtc,
      createdByUserId,
      updatedByUserId,
      rowVersion,
      isDeleted,
      syncStatus,
      lastSyncedAtUtc);

  /// Create a copy of VaccineProtocol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineProtocolImplCopyWith<_$VaccineProtocolImpl> get copyWith =>
      __$$VaccineProtocolImplCopyWithImpl<_$VaccineProtocolImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineProtocolImplToJson(
      this,
    );
  }
}

abstract class _VaccineProtocol implements VaccineProtocol {
  const factory _VaccineProtocol(
      {required final String id,
      required final ProtocolType type,
      required final String name,
      final String? schedule,
      final String? diseaseType,
      final String? dosageInterval,
      final int? lastDateUtc,
      final int? nextDateUtc,
      required final int createdAtUtc,
      required final int updatedAtUtc,
      final String? createdByUserId,
      final String? updatedByUserId,
      final int rowVersion,
      final bool isDeleted,
      final String syncStatus,
      final int? lastSyncedAtUtc}) = _$VaccineProtocolImpl;

  factory _VaccineProtocol.fromJson(Map<String, dynamic> json) =
      _$VaccineProtocolImpl.fromJson;

  @override
  String get id;
  @override
  ProtocolType get type;
  @override
  String get name;
  @override
  String? get schedule; // annual | 6months | 2months | once
  @override
  String? get diseaseType;
  @override
  String? get dosageInterval;
  @override
  int? get lastDateUtc;
  @override
  int? get nextDateUtc;
  @override
  int get createdAtUtc;
  @override
  int get updatedAtUtc;
  @override
  String? get createdByUserId;
  @override
  String? get updatedByUserId;
  @override
  int get rowVersion;
  @override
  bool get isDeleted;
  @override
  String get syncStatus;
  @override
  int? get lastSyncedAtUtc;

  /// Create a copy of VaccineProtocol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineProtocolImplCopyWith<_$VaccineProtocolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
