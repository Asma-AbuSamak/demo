// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicineLog _$MedicineLogFromJson(Map<String, dynamic> json) {
  return _MedicineLog.fromJson(json);
}

/// @nodoc
mixin _$MedicineLog {
  String get id => throw _privateConstructorUsedError;
  String get medicineId => throw _privateConstructorUsedError;
  int get dateUtc => throw _privateConstructorUsedError;
  MedicineLogType get type => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  int? get purchasePriceMinor => throw _privateConstructorUsedError;
  int? get batchExpiryDateUtc => throw _privateConstructorUsedError;
  int get createdAtUtc => throw _privateConstructorUsedError;
  int get updatedAtUtc => throw _privateConstructorUsedError;
  String? get createdByUserId => throw _privateConstructorUsedError;
  String? get updatedByUserId => throw _privateConstructorUsedError;
  int get rowVersion => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  int? get lastSyncedAtUtc => throw _privateConstructorUsedError;

  /// Serializes this MedicineLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicineLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicineLogCopyWith<MedicineLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineLogCopyWith<$Res> {
  factory $MedicineLogCopyWith(
          MedicineLog value, $Res Function(MedicineLog) then) =
      _$MedicineLogCopyWithImpl<$Res, MedicineLog>;
  @useResult
  $Res call(
      {String id,
      String medicineId,
      int dateUtc,
      MedicineLogType type,
      int quantity,
      String note,
      String? vendorId,
      int? purchasePriceMinor,
      int? batchExpiryDateUtc,
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
class _$MedicineLogCopyWithImpl<$Res, $Val extends MedicineLog>
    implements $MedicineLogCopyWith<$Res> {
  _$MedicineLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicineLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicineId = null,
    Object? dateUtc = null,
    Object? type = null,
    Object? quantity = null,
    Object? note = null,
    Object? vendorId = freezed,
    Object? purchasePriceMinor = freezed,
    Object? batchExpiryDateUtc = freezed,
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
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as String,
      dateUtc: null == dateUtc
          ? _value.dateUtc
          : dateUtc // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicineLogType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePriceMinor: freezed == purchasePriceMinor
          ? _value.purchasePriceMinor
          : purchasePriceMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      batchExpiryDateUtc: freezed == batchExpiryDateUtc
          ? _value.batchExpiryDateUtc
          : batchExpiryDateUtc // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MedicineLogImplCopyWith<$Res>
    implements $MedicineLogCopyWith<$Res> {
  factory _$$MedicineLogImplCopyWith(
          _$MedicineLogImpl value, $Res Function(_$MedicineLogImpl) then) =
      __$$MedicineLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String medicineId,
      int dateUtc,
      MedicineLogType type,
      int quantity,
      String note,
      String? vendorId,
      int? purchasePriceMinor,
      int? batchExpiryDateUtc,
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
class __$$MedicineLogImplCopyWithImpl<$Res>
    extends _$MedicineLogCopyWithImpl<$Res, _$MedicineLogImpl>
    implements _$$MedicineLogImplCopyWith<$Res> {
  __$$MedicineLogImplCopyWithImpl(
      _$MedicineLogImpl _value, $Res Function(_$MedicineLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicineLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? medicineId = null,
    Object? dateUtc = null,
    Object? type = null,
    Object? quantity = null,
    Object? note = null,
    Object? vendorId = freezed,
    Object? purchasePriceMinor = freezed,
    Object? batchExpiryDateUtc = freezed,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_$MedicineLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      medicineId: null == medicineId
          ? _value.medicineId
          : medicineId // ignore: cast_nullable_to_non_nullable
              as String,
      dateUtc: null == dateUtc
          ? _value.dateUtc
          : dateUtc // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MedicineLogType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePriceMinor: freezed == purchasePriceMinor
          ? _value.purchasePriceMinor
          : purchasePriceMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      batchExpiryDateUtc: freezed == batchExpiryDateUtc
          ? _value.batchExpiryDateUtc
          : batchExpiryDateUtc // ignore: cast_nullable_to_non_nullable
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
class _$MedicineLogImpl implements _MedicineLog {
  const _$MedicineLogImpl(
      {required this.id,
      required this.medicineId,
      required this.dateUtc,
      required this.type,
      required this.quantity,
      required this.note,
      this.vendorId,
      this.purchasePriceMinor,
      this.batchExpiryDateUtc,
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      this.rowVersion = 0,
      this.isDeleted = false,
      this.syncStatus = 'pending',
      this.lastSyncedAtUtc});

  factory _$MedicineLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicineLogImplFromJson(json);

  @override
  final String id;
  @override
  final String medicineId;
  @override
  final int dateUtc;
  @override
  final MedicineLogType type;
  @override
  final int quantity;
  @override
  final String note;
  @override
  final String? vendorId;
  @override
  final int? purchasePriceMinor;
  @override
  final int? batchExpiryDateUtc;
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
    return 'MedicineLog(id: $id, medicineId: $medicineId, dateUtc: $dateUtc, type: $type, quantity: $quantity, note: $note, vendorId: $vendorId, purchasePriceMinor: $purchasePriceMinor, batchExpiryDateUtc: $batchExpiryDateUtc, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, createdByUserId: $createdByUserId, updatedByUserId: $updatedByUserId, rowVersion: $rowVersion, isDeleted: $isDeleted, syncStatus: $syncStatus, lastSyncedAtUtc: $lastSyncedAtUtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.medicineId, medicineId) ||
                other.medicineId == medicineId) &&
            (identical(other.dateUtc, dateUtc) || other.dateUtc == dateUtc) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.purchasePriceMinor, purchasePriceMinor) ||
                other.purchasePriceMinor == purchasePriceMinor) &&
            (identical(other.batchExpiryDateUtc, batchExpiryDateUtc) ||
                other.batchExpiryDateUtc == batchExpiryDateUtc) &&
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
      medicineId,
      dateUtc,
      type,
      quantity,
      note,
      vendorId,
      purchasePriceMinor,
      batchExpiryDateUtc,
      createdAtUtc,
      updatedAtUtc,
      createdByUserId,
      updatedByUserId,
      rowVersion,
      isDeleted,
      syncStatus,
      lastSyncedAtUtc);

  /// Create a copy of MedicineLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineLogImplCopyWith<_$MedicineLogImpl> get copyWith =>
      __$$MedicineLogImplCopyWithImpl<_$MedicineLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicineLogImplToJson(
      this,
    );
  }
}

abstract class _MedicineLog implements MedicineLog {
  const factory _MedicineLog(
      {required final String id,
      required final String medicineId,
      required final int dateUtc,
      required final MedicineLogType type,
      required final int quantity,
      required final String note,
      final String? vendorId,
      final int? purchasePriceMinor,
      final int? batchExpiryDateUtc,
      required final int createdAtUtc,
      required final int updatedAtUtc,
      final String? createdByUserId,
      final String? updatedByUserId,
      final int rowVersion,
      final bool isDeleted,
      final String syncStatus,
      final int? lastSyncedAtUtc}) = _$MedicineLogImpl;

  factory _MedicineLog.fromJson(Map<String, dynamic> json) =
      _$MedicineLogImpl.fromJson;

  @override
  String get id;
  @override
  String get medicineId;
  @override
  int get dateUtc;
  @override
  MedicineLogType get type;
  @override
  int get quantity;
  @override
  String get note;
  @override
  String? get vendorId;
  @override
  int? get purchasePriceMinor;
  @override
  int? get batchExpiryDateUtc;
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

  /// Create a copy of MedicineLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineLogImplCopyWith<_$MedicineLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
