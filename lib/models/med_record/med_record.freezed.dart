// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'med_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedRecord _$MedRecordFromJson(Map<String, dynamic> json) {
  return _MedRecord.fromJson(json);
}

/// @nodoc
mixin _$MedRecord {
  String get id => throw _privateConstructorUsedError;
  String get animalId => throw _privateConstructorUsedError;
  int get dateUtc => throw _privateConstructorUsedError;
  MedType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get createdAtUtc => throw _privateConstructorUsedError;
  int get updatedAtUtc => throw _privateConstructorUsedError;
  String? get createdByUserId => throw _privateConstructorUsedError;
  String? get updatedByUserId => throw _privateConstructorUsedError;
  int get rowVersion => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  int? get lastSyncedAtUtc => throw _privateConstructorUsedError;

  /// Serializes this MedRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedRecordCopyWith<MedRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedRecordCopyWith<$Res> {
  factory $MedRecordCopyWith(MedRecord value, $Res Function(MedRecord) then) =
      _$MedRecordCopyWithImpl<$Res, MedRecord>;
  @useResult
  $Res call(
      {String id,
      String animalId,
      int dateUtc,
      MedType type,
      String description,
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
class _$MedRecordCopyWithImpl<$Res, $Val extends MedRecord>
    implements $MedRecordCopyWith<$Res> {
  _$MedRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? animalId = null,
    Object? dateUtc = null,
    Object? type = null,
    Object? description = null,
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
      animalId: null == animalId
          ? _value.animalId
          : animalId // ignore: cast_nullable_to_non_nullable
              as String,
      dateUtc: null == dateUtc
          ? _value.dateUtc
          : dateUtc // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$MedRecordImplCopyWith<$Res>
    implements $MedRecordCopyWith<$Res> {
  factory _$$MedRecordImplCopyWith(
          _$MedRecordImpl value, $Res Function(_$MedRecordImpl) then) =
      __$$MedRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String animalId,
      int dateUtc,
      MedType type,
      String description,
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
class __$$MedRecordImplCopyWithImpl<$Res>
    extends _$MedRecordCopyWithImpl<$Res, _$MedRecordImpl>
    implements _$$MedRecordImplCopyWith<$Res> {
  __$$MedRecordImplCopyWithImpl(
      _$MedRecordImpl _value, $Res Function(_$MedRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? animalId = null,
    Object? dateUtc = null,
    Object? type = null,
    Object? description = null,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_$MedRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      animalId: null == animalId
          ? _value.animalId
          : animalId // ignore: cast_nullable_to_non_nullable
              as String,
      dateUtc: null == dateUtc
          ? _value.dateUtc
          : dateUtc // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$MedRecordImpl implements _MedRecord {
  const _$MedRecordImpl(
      {required this.id,
      required this.animalId,
      required this.dateUtc,
      required this.type,
      required this.description,
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      this.rowVersion = 0,
      this.isDeleted = false,
      this.syncStatus = 'pending',
      this.lastSyncedAtUtc});

  factory _$MedRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String animalId;
  @override
  final int dateUtc;
  @override
  final MedType type;
  @override
  final String description;
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
    return 'MedRecord(id: $id, animalId: $animalId, dateUtc: $dateUtc, type: $type, description: $description, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, createdByUserId: $createdByUserId, updatedByUserId: $updatedByUserId, rowVersion: $rowVersion, isDeleted: $isDeleted, syncStatus: $syncStatus, lastSyncedAtUtc: $lastSyncedAtUtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.animalId, animalId) ||
                other.animalId == animalId) &&
            (identical(other.dateUtc, dateUtc) || other.dateUtc == dateUtc) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
      animalId,
      dateUtc,
      type,
      description,
      createdAtUtc,
      updatedAtUtc,
      createdByUserId,
      updatedByUserId,
      rowVersion,
      isDeleted,
      syncStatus,
      lastSyncedAtUtc);

  /// Create a copy of MedRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedRecordImplCopyWith<_$MedRecordImpl> get copyWith =>
      __$$MedRecordImplCopyWithImpl<_$MedRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedRecordImplToJson(
      this,
    );
  }
}

abstract class _MedRecord implements MedRecord {
  const factory _MedRecord(
      {required final String id,
      required final String animalId,
      required final int dateUtc,
      required final MedType type,
      required final String description,
      required final int createdAtUtc,
      required final int updatedAtUtc,
      final String? createdByUserId,
      final String? updatedByUserId,
      final int rowVersion,
      final bool isDeleted,
      final String syncStatus,
      final int? lastSyncedAtUtc}) = _$MedRecordImpl;

  factory _MedRecord.fromJson(Map<String, dynamic> json) =
      _$MedRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get animalId;
  @override
  int get dateUtc;
  @override
  MedType get type;
  @override
  String get description;
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

  /// Create a copy of MedRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedRecordImplCopyWith<_$MedRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
