// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  return _Animal.fromJson(json);
}

/// @nodoc
mixin _$Animal {
  String get id => throw _privateConstructorUsedError;
  String get farmId => throw _privateConstructorUsedError;
  String get tagNumber => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  AnimalStatus get status => throw _privateConstructorUsedError;
  Origin get origin => throw _privateConstructorUsedError;
  int? get weightGrams => throw _privateConstructorUsedError;
  int? get birthDateUtc => throw _privateConstructorUsedError;
  String? get motherId => throw _privateConstructorUsedError;
  String? get fatherId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  int? get purchaseDateUtc => throw _privateConstructorUsedError;
  int? get purchasePriceMinor => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get createdAtUtc => throw _privateConstructorUsedError;
  int get updatedAtUtc => throw _privateConstructorUsedError;
  String? get createdByUserId => throw _privateConstructorUsedError;
  String? get updatedByUserId => throw _privateConstructorUsedError;
  int get rowVersion => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;
  int? get lastSyncedAtUtc => throw _privateConstructorUsedError;

  /// Serializes this Animal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimalCopyWith<Animal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalCopyWith<$Res> {
  factory $AnimalCopyWith(Animal value, $Res Function(Animal) then) =
      _$AnimalCopyWithImpl<$Res, Animal>;
  @useResult
  $Res call(
      {String id,
      String farmId,
      String tagNumber,
      Gender gender,
      String breed,
      AnimalStatus status,
      Origin origin,
      int? weightGrams,
      int? birthDateUtc,
      String? motherId,
      String? fatherId,
      String? vendorId,
      int? purchaseDateUtc,
      int? purchasePriceMinor,
      String currency,
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
class _$AnimalCopyWithImpl<$Res, $Val extends Animal>
    implements $AnimalCopyWith<$Res> {
  _$AnimalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? tagNumber = null,
    Object? gender = null,
    Object? breed = null,
    Object? status = null,
    Object? origin = null,
    Object? weightGrams = freezed,
    Object? birthDateUtc = freezed,
    Object? motherId = freezed,
    Object? fatherId = freezed,
    Object? vendorId = freezed,
    Object? purchaseDateUtc = freezed,
    Object? purchasePriceMinor = freezed,
    Object? currency = null,
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
      farmId: null == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as String,
      tagNumber: null == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimalStatus,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Origin,
      weightGrams: freezed == weightGrams
          ? _value.weightGrams
          : weightGrams // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDateUtc: freezed == birthDateUtc
          ? _value.birthDateUtc
          : birthDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      motherId: freezed == motherId
          ? _value.motherId
          : motherId // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherId: freezed == fatherId
          ? _value.fatherId
          : fatherId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDateUtc: freezed == purchaseDateUtc
          ? _value.purchaseDateUtc
          : purchaseDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePriceMinor: freezed == purchasePriceMinor
          ? _value.purchasePriceMinor
          : purchasePriceMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AnimalImplCopyWith<$Res> implements $AnimalCopyWith<$Res> {
  factory _$$AnimalImplCopyWith(
          _$AnimalImpl value, $Res Function(_$AnimalImpl) then) =
      __$$AnimalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String farmId,
      String tagNumber,
      Gender gender,
      String breed,
      AnimalStatus status,
      Origin origin,
      int? weightGrams,
      int? birthDateUtc,
      String? motherId,
      String? fatherId,
      String? vendorId,
      int? purchaseDateUtc,
      int? purchasePriceMinor,
      String currency,
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
class __$$AnimalImplCopyWithImpl<$Res>
    extends _$AnimalCopyWithImpl<$Res, _$AnimalImpl>
    implements _$$AnimalImplCopyWith<$Res> {
  __$$AnimalImplCopyWithImpl(
      _$AnimalImpl _value, $Res Function(_$AnimalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? tagNumber = null,
    Object? gender = null,
    Object? breed = null,
    Object? status = null,
    Object? origin = null,
    Object? weightGrams = freezed,
    Object? birthDateUtc = freezed,
    Object? motherId = freezed,
    Object? fatherId = freezed,
    Object? vendorId = freezed,
    Object? purchaseDateUtc = freezed,
    Object? purchasePriceMinor = freezed,
    Object? currency = null,
    Object? createdAtUtc = null,
    Object? updatedAtUtc = null,
    Object? createdByUserId = freezed,
    Object? updatedByUserId = freezed,
    Object? rowVersion = null,
    Object? isDeleted = null,
    Object? syncStatus = null,
    Object? lastSyncedAtUtc = freezed,
  }) {
    return _then(_$AnimalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      farmId: null == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as String,
      tagNumber: null == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimalStatus,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Origin,
      weightGrams: freezed == weightGrams
          ? _value.weightGrams
          : weightGrams // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDateUtc: freezed == birthDateUtc
          ? _value.birthDateUtc
          : birthDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      motherId: freezed == motherId
          ? _value.motherId
          : motherId // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherId: freezed == fatherId
          ? _value.fatherId
          : fatherId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDateUtc: freezed == purchaseDateUtc
          ? _value.purchaseDateUtc
          : purchaseDateUtc // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePriceMinor: freezed == purchasePriceMinor
          ? _value.purchasePriceMinor
          : purchasePriceMinor // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
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
class _$AnimalImpl implements _Animal {
  const _$AnimalImpl(
      {required this.id,
      required this.farmId,
      required this.tagNumber,
      required this.gender,
      required this.breed,
      required this.status,
      required this.origin,
      this.weightGrams,
      this.birthDateUtc,
      this.motherId,
      this.fatherId,
      this.vendorId,
      this.purchaseDateUtc,
      this.purchasePriceMinor,
      this.currency = 'JOD',
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      this.rowVersion = 0,
      this.isDeleted = false,
      this.syncStatus = 'pending',
      this.lastSyncedAtUtc});

  factory _$AnimalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimalImplFromJson(json);

  @override
  final String id;
  @override
  final String farmId;
  @override
  final String tagNumber;
  @override
  final Gender gender;
  @override
  final String breed;
  @override
  final AnimalStatus status;
  @override
  final Origin origin;
  @override
  final int? weightGrams;
  @override
  final int? birthDateUtc;
  @override
  final String? motherId;
  @override
  final String? fatherId;
  @override
  final String? vendorId;
  @override
  final int? purchaseDateUtc;
  @override
  final int? purchasePriceMinor;
  @override
  @JsonKey()
  final String currency;
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
    return 'Animal(id: $id, farmId: $farmId, tagNumber: $tagNumber, gender: $gender, breed: $breed, status: $status, origin: $origin, weightGrams: $weightGrams, birthDateUtc: $birthDateUtc, motherId: $motherId, fatherId: $fatherId, vendorId: $vendorId, purchaseDateUtc: $purchaseDateUtc, purchasePriceMinor: $purchasePriceMinor, currency: $currency, createdAtUtc: $createdAtUtc, updatedAtUtc: $updatedAtUtc, createdByUserId: $createdByUserId, updatedByUserId: $updatedByUserId, rowVersion: $rowVersion, isDeleted: $isDeleted, syncStatus: $syncStatus, lastSyncedAtUtc: $lastSyncedAtUtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.tagNumber, tagNumber) ||
                other.tagNumber == tagNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.weightGrams, weightGrams) ||
                other.weightGrams == weightGrams) &&
            (identical(other.birthDateUtc, birthDateUtc) ||
                other.birthDateUtc == birthDateUtc) &&
            (identical(other.motherId, motherId) ||
                other.motherId == motherId) &&
            (identical(other.fatherId, fatherId) ||
                other.fatherId == fatherId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.purchaseDateUtc, purchaseDateUtc) ||
                other.purchaseDateUtc == purchaseDateUtc) &&
            (identical(other.purchasePriceMinor, purchasePriceMinor) ||
                other.purchasePriceMinor == purchasePriceMinor) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        farmId,
        tagNumber,
        gender,
        breed,
        status,
        origin,
        weightGrams,
        birthDateUtc,
        motherId,
        fatherId,
        vendorId,
        purchaseDateUtc,
        purchasePriceMinor,
        currency,
        createdAtUtc,
        updatedAtUtc,
        createdByUserId,
        updatedByUserId,
        rowVersion,
        isDeleted,
        syncStatus,
        lastSyncedAtUtc
      ]);

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimalImplCopyWith<_$AnimalImpl> get copyWith =>
      __$$AnimalImplCopyWithImpl<_$AnimalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimalImplToJson(
      this,
    );
  }
}

abstract class _Animal implements Animal {
  const factory _Animal(
      {required final String id,
      required final String farmId,
      required final String tagNumber,
      required final Gender gender,
      required final String breed,
      required final AnimalStatus status,
      required final Origin origin,
      final int? weightGrams,
      final int? birthDateUtc,
      final String? motherId,
      final String? fatherId,
      final String? vendorId,
      final int? purchaseDateUtc,
      final int? purchasePriceMinor,
      final String currency,
      required final int createdAtUtc,
      required final int updatedAtUtc,
      final String? createdByUserId,
      final String? updatedByUserId,
      final int rowVersion,
      final bool isDeleted,
      final String syncStatus,
      final int? lastSyncedAtUtc}) = _$AnimalImpl;

  factory _Animal.fromJson(Map<String, dynamic> json) = _$AnimalImpl.fromJson;

  @override
  String get id;
  @override
  String get farmId;
  @override
  String get tagNumber;
  @override
  Gender get gender;
  @override
  String get breed;
  @override
  AnimalStatus get status;
  @override
  Origin get origin;
  @override
  int? get weightGrams;
  @override
  int? get birthDateUtc;
  @override
  String? get motherId;
  @override
  String? get fatherId;
  @override
  String? get vendorId;
  @override
  int? get purchaseDateUtc;
  @override
  int? get purchasePriceMinor;
  @override
  String get currency;
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

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimalImplCopyWith<_$AnimalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
