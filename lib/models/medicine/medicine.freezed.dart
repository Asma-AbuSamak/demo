// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Medicine _$MedicineFromJson(Map<String, dynamic> json) {
  return _Medicine.fromJson(json);
}

/// @nodoc
mixin _$Medicine {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get expiryDateUtc => throw _privateConstructorUsedError;
  int get createdAtUtc => throw _privateConstructorUsedError;
  int get updatedAtUtc => throw _privateConstructorUsedError;
  String? get createdByUserId => throw _privateConstructorUsedError;
  String? get updatedByUserId => throw _privateConstructorUsedError;
  int get rowVersion => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  int? get lastSyncedAtUtc => throw _privateConstructorUsedError;

  /// Serializes this Medicine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicineCopyWith<Medicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineCopyWith<$Res> {
  factory $MedicineCopyWith(Medicine value, $Res Function(Medicine) then) =
      _$MedicineCopyWithImpl<$Res, Medicine>;
  @useResult
  $Res call(
      {String id,
      String name,
      int quantity,
      String unit,
      int expiryDateUtc,
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
class _$MedicineCopyWithImpl<$Res, $Val extends Medicine>
    implements $MedicineCopyWith<$Res> {
  _$MedicineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
    Object? expiryDateUtc = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDateUtc: null == expiryDateUtc
          ? _value.expiryDateUtc
          : expiryDateUtc // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$MedicineImplCopyWith<$Res>
    implements $MedicineCopyWith<$Res> {
  factory _$$MedicineImplCopyWith(
          _$MedicineImpl value, $Res Function(_$MedicineImpl) then) =
      __$$MedicineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int quantity,
      String unit,
      int expiryDateUtc,
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
class __$$MedicineImplCopyWithImpl<$Res>
    extends _$MedicineCopyWithImpl<$Res, _$MedicineImpl>
    implements _$$MedicineImplCopyWith<$Res> {
  __$$MedicineImplCopyWithImpl(
      _$MedicineImpl _value, $Res Function(_$MedicineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
    Object? expiryDateUtc = null,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_$MedicineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDateUtc: null == expiryDateUtc
          ? _value.expiryDateUtc
          : expiryDateUtc // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$MedicineImpl implements _Medicine {
  const _$MedicineImpl(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.unit,
      required this.expiryDateUtc,
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      this.rowVersion = 0,
      this.isDeleted = false,
      this.syncStatus = 'pending',
      this.lastSyncedAtUtc});

  factory _$MedicineImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicineImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final String unit;
  @override
  final int expiryDateUtc;
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
    return 'Medicine(id: $id, name: $name, quantity: $quantity, unit: $unit, expiryDateUtc: $expiryDateUtc, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, createdByUserId: $createdByUserId, updatedByUserId: $updatedByUserId, rowVersion: $rowVersion, isDeleted: $isDeleted, syncStatus: $syncStatus, lastSyncedAtUtc: $lastSyncedAtUtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.expiryDateUtc, expiryDateUtc) ||
                other.expiryDateUtc == expiryDateUtc) &&
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
      name,
      quantity,
      unit,
      expiryDateUtc,
      createdAtUtc,
      updatedAtUtc,
      createdByUserId,
      updatedByUserId,
      rowVersion,
      isDeleted,
      syncStatus,
      lastSyncedAtUtc);

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineImplCopyWith<_$MedicineImpl> get copyWith =>
      __$$MedicineImplCopyWithImpl<_$MedicineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicineImplToJson(
      this,
    );
  }
}

abstract class _Medicine implements Medicine {
  const factory _Medicine(
      {required final String id,
      required final String name,
      required final int quantity,
      required final String unit,
      required final int expiryDateUtc,
      required final int createdAtUtc,
      required final int updatedAtUtc,
      final String? createdByUserId,
      final String? updatedByUserId,
      final int rowVersion,
      final bool isDeleted,
      final String syncStatus,
      final int? lastSyncedAtUtc}) = _$MedicineImpl;

  factory _Medicine.fromJson(Map<String, dynamic> json) =
      _$MedicineImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get quantity;
  @override
  String get unit;
  @override
  int get expiryDateUtc;
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

  /// Create a copy of Medicine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineImplCopyWith<_$MedicineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
