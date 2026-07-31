// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaleRecord _$SaleRecordFromJson(Map<String, dynamic> json) {
  return _SaleRecord.fromJson(json);
}

/// @nodoc
mixin _$SaleRecord {
  String get id => throw _privateConstructorUsedError;
  String get animalId => throw _privateConstructorUsedError;
  int get dateUtc => throw _privateConstructorUsedError;
  int get salePriceMinor => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  int? get purchasePriceMinor => throw _privateConstructorUsedError;
  int get createdAtUtc => throw _privateConstructorUsedError;
  int get updatedAtUtc => throw _privateConstructorUsedError;
  String? get createdByUserId => throw _privateConstructorUsedError;
  String? get updatedByUserId => throw _privateConstructorUsedError;
  int get rowVersion => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  int? get lastSyncedAtUtc => throw _privateConstructorUsedError;

  /// Serializes this SaleRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleRecordCopyWith<SaleRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleRecordCopyWith<$Res> {
  factory $SaleRecordCopyWith(
          SaleRecord value, $Res Function(SaleRecord) then) =
      _$SaleRecordCopyWithImpl<$Res, SaleRecord>;
  @useResult
  $Res call(
      {String id,
      String animalId,
      int dateUtc,
      int salePriceMinor,
      String breed,
      Gender gender,
      int? purchasePriceMinor,
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
class _$SaleRecordCopyWithImpl<$Res, $Val extends SaleRecord>
    implements $SaleRecordCopyWith<$Res> {
  _$SaleRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? animalId = null,
    Object? dateUtc = null,
    Object? salePriceMinor = null,
    Object? breed = null,
    Object? gender = null,
    Object? purchasePriceMinor = freezed,
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
      salePriceMinor: null == salePriceMinor
          ? _value.salePriceMinor
          : salePriceMinor // ignore: cast_nullable_to_non_nullable
              as int,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      purchasePriceMinor: freezed == purchasePriceMinor
          ? _value.purchasePriceMinor
          : purchasePriceMinor // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SaleRecordImplCopyWith<$Res>
    implements $SaleRecordCopyWith<$Res> {
  factory _$$SaleRecordImplCopyWith(
          _$SaleRecordImpl value, $Res Function(_$SaleRecordImpl) then) =
      __$$SaleRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String animalId,
      int dateUtc,
      int salePriceMinor,
      String breed,
      Gender gender,
      int? purchasePriceMinor,
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
class __$$SaleRecordImplCopyWithImpl<$Res>
    extends _$SaleRecordCopyWithImpl<$Res, _$SaleRecordImpl>
    implements _$$SaleRecordImplCopyWith<$Res> {
  __$$SaleRecordImplCopyWithImpl(
      _$SaleRecordImpl _value, $Res Function(_$SaleRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? animalId = null,
    Object? dateUtc = null,
    Object? salePriceMinor = null,
    Object? breed = null,
    Object? gender = null,
    Object? purchasePriceMinor = freezed,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_$SaleRecordImpl(
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
      salePriceMinor: null == salePriceMinor
          ? _value.salePriceMinor
          : salePriceMinor // ignore: cast_nullable_to_non_nullable
              as int,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      purchasePriceMinor: freezed == purchasePriceMinor
          ? _value.purchasePriceMinor
          : purchasePriceMinor // ignore: cast_nullable_to_non_nullable
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
class _$SaleRecordImpl implements _SaleRecord {
  const _$SaleRecordImpl(
      {required this.id,
      required this.animalId,
      required this.dateUtc,
      required this.salePriceMinor,
      required this.breed,
      required this.gender,
      this.purchasePriceMinor,
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      this.rowVersion = 0,
      this.isDeleted = false,
      this.syncStatus = 'pending',
      this.lastSyncedAtUtc});

  factory _$SaleRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String animalId;
  @override
  final int dateUtc;
  @override
  final int salePriceMinor;
  @override
  final String breed;
  @override
  final Gender gender;
  @override
  final int? purchasePriceMinor;
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
    return 'SaleRecord(id: $id, animalId: $animalId, dateUtc: $dateUtc, salePriceMinor: $salePriceMinor, breed: $breed, gender: $gender, purchasePriceMinor: $purchasePriceMinor, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, createdByUserId: $createdByUserId, updatedByUserId: $updatedByUserId, rowVersion: $rowVersion, isDeleted: $isDeleted, syncStatus: $syncStatus, lastSyncedAtUtc: $lastSyncedAtUtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.animalId, animalId) ||
                other.animalId == animalId) &&
            (identical(other.dateUtc, dateUtc) || other.dateUtc == dateUtc) &&
            (identical(other.salePriceMinor, salePriceMinor) ||
                other.salePriceMinor == salePriceMinor) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.purchasePriceMinor, purchasePriceMinor) ||
                other.purchasePriceMinor == purchasePriceMinor) &&
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
      salePriceMinor,
      breed,
      gender,
      purchasePriceMinor,
      createdAtUtc,
      updatedAtUtc,
      createdByUserId,
      updatedByUserId,
      rowVersion,
      isDeleted,
      syncStatus,
      lastSyncedAtUtc);

  /// Create a copy of SaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleRecordImplCopyWith<_$SaleRecordImpl> get copyWith =>
      __$$SaleRecordImplCopyWithImpl<_$SaleRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleRecordImplToJson(
      this,
    );
  }
}

abstract class _SaleRecord implements SaleRecord {
  const factory _SaleRecord(
      {required final String id,
      required final String animalId,
      required final int dateUtc,
      required final int salePriceMinor,
      required final String breed,
      required final Gender gender,
      final int? purchasePriceMinor,
      required final int createdAtUtc,
      required final int updatedAtUtc,
      final String? createdByUserId,
      final String? updatedByUserId,
      final int rowVersion,
      final bool isDeleted,
      final String syncStatus,
      final int? lastSyncedAtUtc}) = _$SaleRecordImpl;

  factory _SaleRecord.fromJson(Map<String, dynamic> json) =
      _$SaleRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get animalId;
  @override
  int get dateUtc;
  @override
  int get salePriceMinor;
  @override
  String get breed;
  @override
  Gender get gender;
  @override
  int? get purchasePriceMinor;
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

  /// Create a copy of SaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleRecordImplCopyWith<_$SaleRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
