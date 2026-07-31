// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breeding_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BreedingRecord _$BreedingRecordFromJson(Map<String, dynamic> json) {
  return _BreedingRecord.fromJson(json);
}

/// @nodoc
mixin _$BreedingRecord {
  String get id => throw _privateConstructorUsedError;
  String get femaleId => throw _privateConstructorUsedError;
  String get maleId => throw _privateConstructorUsedError;
  int get dateUtc => throw _privateConstructorUsedError;
  BreedingStatus get status => throw _privateConstructorUsedError;
  int get createdAtUtc => throw _privateConstructorUsedError;
  int get updatedAtUtc => throw _privateConstructorUsedError;
  String? get createdByUserId => throw _privateConstructorUsedError;
  String? get updatedByUserId => throw _privateConstructorUsedError;
  int get rowVersion => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  int? get lastSyncedAtUtc => throw _privateConstructorUsedError;

  /// Serializes this BreedingRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreedingRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreedingRecordCopyWith<BreedingRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedingRecordCopyWith<$Res> {
  factory $BreedingRecordCopyWith(
          BreedingRecord value, $Res Function(BreedingRecord) then) =
      _$BreedingRecordCopyWithImpl<$Res, BreedingRecord>;
  @useResult
  $Res call(
      {String id,
      String femaleId,
      String maleId,
      int dateUtc,
      BreedingStatus status,
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
class _$BreedingRecordCopyWithImpl<$Res, $Val extends BreedingRecord>
    implements $BreedingRecordCopyWith<$Res> {
  _$BreedingRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreedingRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? femaleId = null,
    Object? maleId = null,
    Object? dateUtc = null,
    Object? status = null,
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
      femaleId: null == femaleId
          ? _value.femaleId
          : femaleId // ignore: cast_nullable_to_non_nullable
              as String,
      maleId: null == maleId
          ? _value.maleId
          : maleId // ignore: cast_nullable_to_non_nullable
              as String,
      dateUtc: null == dateUtc
          ? _value.dateUtc
          : dateUtc // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedingStatus,
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
abstract class _$$BreedingRecordImplCopyWith<$Res>
    implements $BreedingRecordCopyWith<$Res> {
  factory _$$BreedingRecordImplCopyWith(_$BreedingRecordImpl value,
          $Res Function(_$BreedingRecordImpl) then) =
      __$$BreedingRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String femaleId,
      String maleId,
      int dateUtc,
      BreedingStatus status,
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
class __$$BreedingRecordImplCopyWithImpl<$Res>
    extends _$BreedingRecordCopyWithImpl<$Res, _$BreedingRecordImpl>
    implements _$$BreedingRecordImplCopyWith<$Res> {
  __$$BreedingRecordImplCopyWithImpl(
      _$BreedingRecordImpl _value, $Res Function(_$BreedingRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of BreedingRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? femaleId = null,
    Object? maleId = null,
    Object? dateUtc = null,
    Object? status = null,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_$BreedingRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      femaleId: null == femaleId
          ? _value.femaleId
          : femaleId // ignore: cast_nullable_to_non_nullable
              as String,
      maleId: null == maleId
          ? _value.maleId
          : maleId // ignore: cast_nullable_to_non_nullable
              as String,
      dateUtc: null == dateUtc
          ? _value.dateUtc
          : dateUtc // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BreedingStatus,
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
class _$BreedingRecordImpl implements _BreedingRecord {
  const _$BreedingRecordImpl(
      {required this.id,
      required this.femaleId,
      required this.maleId,
      required this.dateUtc,
      required this.status,
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      this.rowVersion = 0,
      this.isDeleted = false,
      this.syncStatus = 'pending',
      this.lastSyncedAtUtc});

  factory _$BreedingRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedingRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String femaleId;
  @override
  final String maleId;
  @override
  final int dateUtc;
  @override
  final BreedingStatus status;
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
    return 'BreedingRecord(id: $id, femaleId: $femaleId, maleId: $maleId, dateUtc: $dateUtc, status: $status, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, createdByUserId: $createdByUserId, updatedByUserId: $updatedByUserId, rowVersion: $rowVersion, isDeleted: $isDeleted, syncStatus: $syncStatus, lastSyncedAtUtc: $lastSyncedAtUtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedingRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.femaleId, femaleId) ||
                other.femaleId == femaleId) &&
            (identical(other.maleId, maleId) || other.maleId == maleId) &&
            (identical(other.dateUtc, dateUtc) || other.dateUtc == dateUtc) &&
            (identical(other.status, status) || other.status == status) &&
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
      femaleId,
      maleId,
      dateUtc,
      status,
      createdAtUtc,
      updatedAtUtc,
      createdByUserId,
      updatedByUserId,
      rowVersion,
      isDeleted,
      syncStatus,
      lastSyncedAtUtc);

  /// Create a copy of BreedingRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedingRecordImplCopyWith<_$BreedingRecordImpl> get copyWith =>
      __$$BreedingRecordImplCopyWithImpl<_$BreedingRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedingRecordImplToJson(
      this,
    );
  }
}

abstract class _BreedingRecord implements BreedingRecord {
  const factory _BreedingRecord(
      {required final String id,
      required final String femaleId,
      required final String maleId,
      required final int dateUtc,
      required final BreedingStatus status,
      required final int createdAtUtc,
      required final int updatedAtUtc,
      final String? createdByUserId,
      final String? updatedByUserId,
      final int rowVersion,
      final bool isDeleted,
      final String syncStatus,
      final int? lastSyncedAtUtc}) = _$BreedingRecordImpl;

  factory _BreedingRecord.fromJson(Map<String, dynamic> json) =
      _$BreedingRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get femaleId;
  @override
  String get maleId;
  @override
  int get dateUtc;
  @override
  BreedingStatus get status;
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

  /// Create a copy of BreedingRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreedingRecordImplCopyWith<_$BreedingRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
