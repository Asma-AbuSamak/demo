// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AnimalsTable extends Animals with TableInfo<$AnimalsTable, Animal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnimalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _farmIdMeta = const VerificationMeta('farmId');
  @override
  late final GeneratedColumn<String> farmId = GeneratedColumn<String>(
      'farm_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagNumberMeta =
      const VerificationMeta('tagNumber');
  @override
  late final GeneratedColumn<String> tagNumber = GeneratedColumn<String>(
      'tag_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Gender, int> gender =
      GeneratedColumn<int>('gender', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Gender>($AnimalsTable.$convertergender);
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
      'breed', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<AnimalStatus, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<AnimalStatus>($AnimalsTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<Origin, int> origin =
      GeneratedColumn<int>('origin', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Origin>($AnimalsTable.$converterorigin);
  static const VerificationMeta _weightGramsMeta =
      const VerificationMeta('weightGrams');
  @override
  late final GeneratedColumn<int> weightGrams = GeneratedColumn<int>(
      'weight_grams', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _birthDateUtcMeta =
      const VerificationMeta('birthDateUtc');
  @override
  late final GeneratedColumn<int> birthDateUtc = GeneratedColumn<int>(
      'birth_date_utc', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _motherIdMeta =
      const VerificationMeta('motherId');
  @override
  late final GeneratedColumn<String> motherId = GeneratedColumn<String>(
      'mother_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fatherIdMeta =
      const VerificationMeta('fatherId');
  @override
  late final GeneratedColumn<String> fatherId = GeneratedColumn<String>(
      'father_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vendorIdMeta =
      const VerificationMeta('vendorId');
  @override
  late final GeneratedColumn<String> vendorId = GeneratedColumn<String>(
      'vendor_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _purchaseDateUtcMeta =
      const VerificationMeta('purchaseDateUtc');
  @override
  late final GeneratedColumn<int> purchaseDateUtc = GeneratedColumn<int>(
      'purchase_date_utc', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _purchasePriceMinorMeta =
      const VerificationMeta('purchasePriceMinor');
  @override
  late final GeneratedColumn<int> purchasePriceMinor = GeneratedColumn<int>(
      'purchase_price_minor', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('JOD'));
  static const VerificationMeta _createdAtUtcMeta =
      const VerificationMeta('createdAtUtc');
  @override
  late final GeneratedColumn<int> createdAtUtc = GeneratedColumn<int>(
      'created_at_utc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtUtcMeta =
      const VerificationMeta('updatedAtUtc');
  @override
  late final GeneratedColumn<int> updatedAtUtc = GeneratedColumn<int>(
      'updated_at_utc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdByUserIdMeta =
      const VerificationMeta('createdByUserId');
  @override
  late final GeneratedColumn<String> createdByUserId = GeneratedColumn<String>(
      'created_by_user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedByUserIdMeta =
      const VerificationMeta('updatedByUserId');
  @override
  late final GeneratedColumn<String> updatedByUserId = GeneratedColumn<String>(
      'updated_by_user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _lastSyncedAtUtcMeta =
      const VerificationMeta('lastSyncedAtUtc');
  @override
  late final GeneratedColumn<int> lastSyncedAtUtc = GeneratedColumn<int>(
      'last_synced_at_utc', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
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
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'animals';
  @override
  VerificationContext validateIntegrity(Insertable<Animal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('farm_id')) {
      context.handle(_farmIdMeta,
          farmId.isAcceptableOrUnknown(data['farm_id']!, _farmIdMeta));
    } else if (isInserting) {
      context.missing(_farmIdMeta);
    }
    if (data.containsKey('tag_number')) {
      context.handle(_tagNumberMeta,
          tagNumber.isAcceptableOrUnknown(data['tag_number']!, _tagNumberMeta));
    } else if (isInserting) {
      context.missing(_tagNumberMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
          _breedMeta, breed.isAcceptableOrUnknown(data['breed']!, _breedMeta));
    } else if (isInserting) {
      context.missing(_breedMeta);
    }
    if (data.containsKey('weight_grams')) {
      context.handle(
          _weightGramsMeta,
          weightGrams.isAcceptableOrUnknown(
              data['weight_grams']!, _weightGramsMeta));
    }
    if (data.containsKey('birth_date_utc')) {
      context.handle(
          _birthDateUtcMeta,
          birthDateUtc.isAcceptableOrUnknown(
              data['birth_date_utc']!, _birthDateUtcMeta));
    }
    if (data.containsKey('mother_id')) {
      context.handle(_motherIdMeta,
          motherId.isAcceptableOrUnknown(data['mother_id']!, _motherIdMeta));
    }
    if (data.containsKey('father_id')) {
      context.handle(_fatherIdMeta,
          fatherId.isAcceptableOrUnknown(data['father_id']!, _fatherIdMeta));
    }
    if (data.containsKey('vendor_id')) {
      context.handle(_vendorIdMeta,
          vendorId.isAcceptableOrUnknown(data['vendor_id']!, _vendorIdMeta));
    }
    if (data.containsKey('purchase_date_utc')) {
      context.handle(
          _purchaseDateUtcMeta,
          purchaseDateUtc.isAcceptableOrUnknown(
              data['purchase_date_utc']!, _purchaseDateUtcMeta));
    }
    if (data.containsKey('purchase_price_minor')) {
      context.handle(
          _purchasePriceMinorMeta,
          purchasePriceMinor.isAcceptableOrUnknown(
              data['purchase_price_minor']!, _purchasePriceMinorMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
          _createdAtUtcMeta,
          createdAtUtc.isAcceptableOrUnknown(
              data['created_at_utc']!, _createdAtUtcMeta));
    } else if (isInserting) {
      context.missing(_createdAtUtcMeta);
    }
    if (data.containsKey('updated_at_utc')) {
      context.handle(
          _updatedAtUtcMeta,
          updatedAtUtc.isAcceptableOrUnknown(
              data['updated_at_utc']!, _updatedAtUtcMeta));
    } else if (isInserting) {
      context.missing(_updatedAtUtcMeta);
    }
    if (data.containsKey('created_by_user_id')) {
      context.handle(
          _createdByUserIdMeta,
          createdByUserId.isAcceptableOrUnknown(
              data['created_by_user_id']!, _createdByUserIdMeta));
    }
    if (data.containsKey('updated_by_user_id')) {
      context.handle(
          _updatedByUserIdMeta,
          updatedByUserId.isAcceptableOrUnknown(
              data['updated_by_user_id']!, _updatedByUserIdMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at_utc')) {
      context.handle(
          _lastSyncedAtUtcMeta,
          lastSyncedAtUtc.isAcceptableOrUnknown(
              data['last_synced_at_utc']!, _lastSyncedAtUtcMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Animal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Animal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      farmId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}farm_id'])!,
      tagNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_number'])!,
      gender: $AnimalsTable.$convertergender.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!),
      breed: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed'])!,
      status: $AnimalsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      origin: $AnimalsTable.$converterorigin.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}origin'])!),
      weightGrams: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight_grams']),
      birthDateUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}birth_date_utc']),
      motherId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mother_id']),
      fatherId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}father_id']),
      vendorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vendor_id']),
      purchaseDateUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_date_utc']),
      purchasePriceMinor: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}purchase_price_minor']),
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      createdAtUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at_utc'])!,
      updatedAtUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at_utc'])!,
      createdByUserId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}created_by_user_id']),
      updatedByUserId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}updated_by_user_id']),
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAtUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_synced_at_utc']),
    );
  }

  @override
  $AnimalsTable createAlias(String alias) {
    return $AnimalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Gender, int, int> $convertergender =
      const EnumIndexConverter<Gender>(Gender.values);
  static JsonTypeConverter2<AnimalStatus, int, int> $converterstatus =
      const EnumIndexConverter<AnimalStatus>(AnimalStatus.values);
  static JsonTypeConverter2<Origin, int, int> $converterorigin =
      const EnumIndexConverter<Origin>(Origin.values);
}

class Animal extends DataClass implements Insertable<Animal> {
  final String id;
  final String farmId;
  final String tagNumber;
  final Gender gender;
  final String breed;
  final AnimalStatus status;
  final Origin origin;
  final int? weightGrams;
  final int? birthDateUtc;
  final String? motherId;
  final String? fatherId;
  final String? vendorId;
  final int? purchaseDateUtc;
  final int? purchasePriceMinor;
  final String currency;
  final int createdAtUtc;
  final int updatedAtUtc;
  final String? createdByUserId;
  final String? updatedByUserId;
  final int rowVersion;
  final bool isDeleted;
  final String syncStatus;
  final int? lastSyncedAtUtc;
  const Animal(
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
      required this.currency,
      required this.createdAtUtc,
      required this.updatedAtUtc,
      this.createdByUserId,
      this.updatedByUserId,
      required this.rowVersion,
      required this.isDeleted,
      required this.syncStatus,
      this.lastSyncedAtUtc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['farm_id'] = Variable<String>(farmId);
    map['tag_number'] = Variable<String>(tagNumber);
    {
      map['gender'] =
          Variable<int>($AnimalsTable.$convertergender.toSql(gender));
    }
    map['breed'] = Variable<String>(breed);
    {
      map['status'] =
          Variable<int>($AnimalsTable.$converterstatus.toSql(status));
    }
    {
      map['origin'] =
          Variable<int>($AnimalsTable.$converterorigin.toSql(origin));
    }
    if (!nullToAbsent || weightGrams != null) {
      map['weight_grams'] = Variable<int>(weightGrams);
    }
    if (!nullToAbsent || birthDateUtc != null) {
      map['birth_date_utc'] = Variable<int>(birthDateUtc);
    }
    if (!nullToAbsent || motherId != null) {
      map['mother_id'] = Variable<String>(motherId);
    }
    if (!nullToAbsent || fatherId != null) {
      map['father_id'] = Variable<String>(fatherId);
    }
    if (!nullToAbsent || vendorId != null) {
      map['vendor_id'] = Variable<String>(vendorId);
    }
    if (!nullToAbsent || purchaseDateUtc != null) {
      map['purchase_date_utc'] = Variable<int>(purchaseDateUtc);
    }
    if (!nullToAbsent || purchasePriceMinor != null) {
      map['purchase_price_minor'] = Variable<int>(purchasePriceMinor);
    }
    map['currency'] = Variable<String>(currency);
    map['created_at_utc'] = Variable<int>(createdAtUtc);
    map['updated_at_utc'] = Variable<int>(updatedAtUtc);
    if (!nullToAbsent || createdByUserId != null) {
      map['created_by_user_id'] = Variable<String>(createdByUserId);
    }
    if (!nullToAbsent || updatedByUserId != null) {
      map['updated_by_user_id'] = Variable<String>(updatedByUserId);
    }
    map['row_version'] = Variable<int>(rowVersion);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAtUtc != null) {
      map['last_synced_at_utc'] = Variable<int>(lastSyncedAtUtc);
    }
    return map;
  }

  AnimalsCompanion toCompanion(bool nullToAbsent) {
    return AnimalsCompanion(
      id: Value(id),
      farmId: Value(farmId),
      tagNumber: Value(tagNumber),
      gender: Value(gender),
      breed: Value(breed),
      status: Value(status),
      origin: Value(origin),
      weightGrams: weightGrams == null && nullToAbsent
          ? const Value.absent()
          : Value(weightGrams),
      birthDateUtc: birthDateUtc == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDateUtc),
      motherId: motherId == null && nullToAbsent
          ? const Value.absent()
          : Value(motherId),
      fatherId: fatherId == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherId),
      vendorId: vendorId == null && nullToAbsent
          ? const Value.absent()
          : Value(vendorId),
      purchaseDateUtc: purchaseDateUtc == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseDateUtc),
      purchasePriceMinor: purchasePriceMinor == null && nullToAbsent
          ? const Value.absent()
          : Value(purchasePriceMinor),
      currency: Value(currency),
      createdAtUtc: Value(createdAtUtc),
      updatedAtUtc: Value(updatedAtUtc),
      createdByUserId: createdByUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(createdByUserId),
      updatedByUserId: updatedByUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedByUserId),
      rowVersion: Value(rowVersion),
      isDeleted: Value(isDeleted),
      syncStatus: Value(syncStatus),
      lastSyncedAtUtc: lastSyncedAtUtc == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAtUtc),
    );
  }

  factory Animal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Animal(
      id: serializer.fromJson<String>(json['id']),
      farmId: serializer.fromJson<String>(json['farmId']),
      tagNumber: serializer.fromJson<String>(json['tagNumber']),
      gender: $AnimalsTable.$convertergender
          .fromJson(serializer.fromJson<int>(json['gender'])),
      breed: serializer.fromJson<String>(json['breed']),
      status: $AnimalsTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      origin: $AnimalsTable.$converterorigin
          .fromJson(serializer.fromJson<int>(json['origin'])),
      weightGrams: serializer.fromJson<int?>(json['weightGrams']),
      birthDateUtc: serializer.fromJson<int?>(json['birthDateUtc']),
      motherId: serializer.fromJson<String?>(json['motherId']),
      fatherId: serializer.fromJson<String?>(json['fatherId']),
      vendorId: serializer.fromJson<String?>(json['vendorId']),
      purchaseDateUtc: serializer.fromJson<int?>(json['purchaseDateUtc']),
      purchasePriceMinor: serializer.fromJson<int?>(json['purchasePriceMinor']),
      currency: serializer.fromJson<String>(json['currency']),
      createdAtUtc: serializer.fromJson<int>(json['createdAtUtc']),
      updatedAtUtc: serializer.fromJson<int>(json['updatedAtUtc']),
      createdByUserId: serializer.fromJson<String?>(json['createdByUserId']),
      updatedByUserId: serializer.fromJson<String?>(json['updatedByUserId']),
      rowVersion: serializer.fromJson<int>(json['rowVersion']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAtUtc: serializer.fromJson<int?>(json['lastSyncedAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'farmId': serializer.toJson<String>(farmId),
      'tagNumber': serializer.toJson<String>(tagNumber),
      'gender':
          serializer.toJson<int>($AnimalsTable.$convertergender.toJson(gender)),
      'breed': serializer.toJson<String>(breed),
      'status':
          serializer.toJson<int>($AnimalsTable.$converterstatus.toJson(status)),
      'origin':
          serializer.toJson<int>($AnimalsTable.$converterorigin.toJson(origin)),
      'weightGrams': serializer.toJson<int?>(weightGrams),
      'birthDateUtc': serializer.toJson<int?>(birthDateUtc),
      'motherId': serializer.toJson<String?>(motherId),
      'fatherId': serializer.toJson<String?>(fatherId),
      'vendorId': serializer.toJson<String?>(vendorId),
      'purchaseDateUtc': serializer.toJson<int?>(purchaseDateUtc),
      'purchasePriceMinor': serializer.toJson<int?>(purchasePriceMinor),
      'currency': serializer.toJson<String>(currency),
      'createdAtUtc': serializer.toJson<int>(createdAtUtc),
      'updatedAtUtc': serializer.toJson<int>(updatedAtUtc),
      'createdByUserId': serializer.toJson<String?>(createdByUserId),
      'updatedByUserId': serializer.toJson<String?>(updatedByUserId),
      'rowVersion': serializer.toJson<int>(rowVersion),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAtUtc': serializer.toJson<int?>(lastSyncedAtUtc),
    };
  }

  Animal copyWith(
          {String? id,
          String? farmId,
          String? tagNumber,
          Gender? gender,
          String? breed,
          AnimalStatus? status,
          Origin? origin,
          Value<int?> weightGrams = const Value.absent(),
          Value<int?> birthDateUtc = const Value.absent(),
          Value<String?> motherId = const Value.absent(),
          Value<String?> fatherId = const Value.absent(),
          Value<String?> vendorId = const Value.absent(),
          Value<int?> purchaseDateUtc = const Value.absent(),
          Value<int?> purchasePriceMinor = const Value.absent(),
          String? currency,
          int? createdAtUtc,
          int? updatedAtUtc,
          Value<String?> createdByUserId = const Value.absent(),
          Value<String?> updatedByUserId = const Value.absent(),
          int? rowVersion,
          bool? isDeleted,
          String? syncStatus,
          Value<int?> lastSyncedAtUtc = const Value.absent()}) =>
      Animal(
        id: id ?? this.id,
        farmId: farmId ?? this.farmId,
        tagNumber: tagNumber ?? this.tagNumber,
        gender: gender ?? this.gender,
        breed: breed ?? this.breed,
        status: status ?? this.status,
        origin: origin ?? this.origin,
        weightGrams: weightGrams.present ? weightGrams.value : this.weightGrams,
        birthDateUtc:
            birthDateUtc.present ? birthDateUtc.value : this.birthDateUtc,
        motherId: motherId.present ? motherId.value : this.motherId,
        fatherId: fatherId.present ? fatherId.value : this.fatherId,
        vendorId: vendorId.present ? vendorId.value : this.vendorId,
        purchaseDateUtc: purchaseDateUtc.present
            ? purchaseDateUtc.value
            : this.purchaseDateUtc,
        purchasePriceMinor: purchasePriceMinor.present
            ? purchasePriceMinor.value
            : this.purchasePriceMinor,
        currency: currency ?? this.currency,
        createdAtUtc: createdAtUtc ?? this.createdAtUtc,
        updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
        createdByUserId: createdByUserId.present
            ? createdByUserId.value
            : this.createdByUserId,
        updatedByUserId: updatedByUserId.present
            ? updatedByUserId.value
            : this.updatedByUserId,
        rowVersion: rowVersion ?? this.rowVersion,
        isDeleted: isDeleted ?? this.isDeleted,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAtUtc: lastSyncedAtUtc.present
            ? lastSyncedAtUtc.value
            : this.lastSyncedAtUtc,
      );
  Animal copyWithCompanion(AnimalsCompanion data) {
    return Animal(
      id: data.id.present ? data.id.value : this.id,
      farmId: data.farmId.present ? data.farmId.value : this.farmId,
      tagNumber: data.tagNumber.present ? data.tagNumber.value : this.tagNumber,
      gender: data.gender.present ? data.gender.value : this.gender,
      breed: data.breed.present ? data.breed.value : this.breed,
      status: data.status.present ? data.status.value : this.status,
      origin: data.origin.present ? data.origin.value : this.origin,
      weightGrams:
          data.weightGrams.present ? data.weightGrams.value : this.weightGrams,
      birthDateUtc: data.birthDateUtc.present
          ? data.birthDateUtc.value
          : this.birthDateUtc,
      motherId: data.motherId.present ? data.motherId.value : this.motherId,
      fatherId: data.fatherId.present ? data.fatherId.value : this.fatherId,
      vendorId: data.vendorId.present ? data.vendorId.value : this.vendorId,
      purchaseDateUtc: data.purchaseDateUtc.present
          ? data.purchaseDateUtc.value
          : this.purchaseDateUtc,
      purchasePriceMinor: data.purchasePriceMinor.present
          ? data.purchasePriceMinor.value
          : this.purchasePriceMinor,
      currency: data.currency.present ? data.currency.value : this.currency,
      createdAtUtc: data.createdAtUtc.present
          ? data.createdAtUtc.value
          : this.createdAtUtc,
      updatedAtUtc: data.updatedAtUtc.present
          ? data.updatedAtUtc.value
          : this.updatedAtUtc,
      createdByUserId: data.createdByUserId.present
          ? data.createdByUserId.value
          : this.createdByUserId,
      updatedByUserId: data.updatedByUserId.present
          ? data.updatedByUserId.value
          : this.updatedByUserId,
      rowVersion:
          data.rowVersion.present ? data.rowVersion.value : this.rowVersion,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAtUtc: data.lastSyncedAtUtc.present
          ? data.lastSyncedAtUtc.value
          : this.lastSyncedAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Animal(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('tagNumber: $tagNumber, ')
          ..write('gender: $gender, ')
          ..write('breed: $breed, ')
          ..write('status: $status, ')
          ..write('origin: $origin, ')
          ..write('weightGrams: $weightGrams, ')
          ..write('birthDateUtc: $birthDateUtc, ')
          ..write('motherId: $motherId, ')
          ..write('fatherId: $fatherId, ')
          ..write('vendorId: $vendorId, ')
          ..write('purchaseDateUtc: $purchaseDateUtc, ')
          ..write('purchasePriceMinor: $purchasePriceMinor, ')
          ..write('currency: $currency, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('updatedAtUtc: $updatedAtUtc, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('updatedByUserId: $updatedByUserId, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAtUtc: $lastSyncedAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Animal &&
          other.id == this.id &&
          other.farmId == this.farmId &&
          other.tagNumber == this.tagNumber &&
          other.gender == this.gender &&
          other.breed == this.breed &&
          other.status == this.status &&
          other.origin == this.origin &&
          other.weightGrams == this.weightGrams &&
          other.birthDateUtc == this.birthDateUtc &&
          other.motherId == this.motherId &&
          other.fatherId == this.fatherId &&
          other.vendorId == this.vendorId &&
          other.purchaseDateUtc == this.purchaseDateUtc &&
          other.purchasePriceMinor == this.purchasePriceMinor &&
          other.currency == this.currency &&
          other.createdAtUtc == this.createdAtUtc &&
          other.updatedAtUtc == this.updatedAtUtc &&
          other.createdByUserId == this.createdByUserId &&
          other.updatedByUserId == this.updatedByUserId &&
          other.rowVersion == this.rowVersion &&
          other.isDeleted == this.isDeleted &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAtUtc == this.lastSyncedAtUtc);
}

class AnimalsCompanion extends UpdateCompanion<Animal> {
  final Value<String> id;
  final Value<String> farmId;
  final Value<String> tagNumber;
  final Value<Gender> gender;
  final Value<String> breed;
  final Value<AnimalStatus> status;
  final Value<Origin> origin;
  final Value<int?> weightGrams;
  final Value<int?> birthDateUtc;
  final Value<String?> motherId;
  final Value<String?> fatherId;
  final Value<String?> vendorId;
  final Value<int?> purchaseDateUtc;
  final Value<int?> purchasePriceMinor;
  final Value<String> currency;
  final Value<int> createdAtUtc;
  final Value<int> updatedAtUtc;
  final Value<String?> createdByUserId;
  final Value<String?> updatedByUserId;
  final Value<int> rowVersion;
  final Value<bool> isDeleted;
  final Value<String> syncStatus;
  final Value<int?> lastSyncedAtUtc;
  final Value<int> rowid;
  const AnimalsCompanion({
    this.id = const Value.absent(),
    this.farmId = const Value.absent(),
    this.tagNumber = const Value.absent(),
    this.gender = const Value.absent(),
    this.breed = const Value.absent(),
    this.status = const Value.absent(),
    this.origin = const Value.absent(),
    this.weightGrams = const Value.absent(),
    this.birthDateUtc = const Value.absent(),
    this.motherId = const Value.absent(),
    this.fatherId = const Value.absent(),
    this.vendorId = const Value.absent(),
    this.purchaseDateUtc = const Value.absent(),
    this.purchasePriceMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.updatedAtUtc = const Value.absent(),
    this.createdByUserId = const Value.absent(),
    this.updatedByUserId = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnimalsCompanion.insert({
    required String id,
    required String farmId,
    required String tagNumber,
    required Gender gender,
    required String breed,
    required AnimalStatus status,
    required Origin origin,
    this.weightGrams = const Value.absent(),
    this.birthDateUtc = const Value.absent(),
    this.motherId = const Value.absent(),
    this.fatherId = const Value.absent(),
    this.vendorId = const Value.absent(),
    this.purchaseDateUtc = const Value.absent(),
    this.purchasePriceMinor = const Value.absent(),
    this.currency = const Value.absent(),
    required int createdAtUtc,
    required int updatedAtUtc,
    this.createdByUserId = const Value.absent(),
    this.updatedByUserId = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        farmId = Value(farmId),
        tagNumber = Value(tagNumber),
        gender = Value(gender),
        breed = Value(breed),
        status = Value(status),
        origin = Value(origin),
        createdAtUtc = Value(createdAtUtc),
        updatedAtUtc = Value(updatedAtUtc);
  static Insertable<Animal> custom({
    Expression<String>? id,
    Expression<String>? farmId,
    Expression<String>? tagNumber,
    Expression<int>? gender,
    Expression<String>? breed,
    Expression<int>? status,
    Expression<int>? origin,
    Expression<int>? weightGrams,
    Expression<int>? birthDateUtc,
    Expression<String>? motherId,
    Expression<String>? fatherId,
    Expression<String>? vendorId,
    Expression<int>? purchaseDateUtc,
    Expression<int>? purchasePriceMinor,
    Expression<String>? currency,
    Expression<int>? createdAtUtc,
    Expression<int>? updatedAtUtc,
    Expression<String>? createdByUserId,
    Expression<String>? updatedByUserId,
    Expression<int>? rowVersion,
    Expression<bool>? isDeleted,
    Expression<String>? syncStatus,
    Expression<int>? lastSyncedAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (farmId != null) 'farm_id': farmId,
      if (tagNumber != null) 'tag_number': tagNumber,
      if (gender != null) 'gender': gender,
      if (breed != null) 'breed': breed,
      if (status != null) 'status': status,
      if (origin != null) 'origin': origin,
      if (weightGrams != null) 'weight_grams': weightGrams,
      if (birthDateUtc != null) 'birth_date_utc': birthDateUtc,
      if (motherId != null) 'mother_id': motherId,
      if (fatherId != null) 'father_id': fatherId,
      if (vendorId != null) 'vendor_id': vendorId,
      if (purchaseDateUtc != null) 'purchase_date_utc': purchaseDateUtc,
      if (purchasePriceMinor != null)
        'purchase_price_minor': purchasePriceMinor,
      if (currency != null) 'currency': currency,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (updatedAtUtc != null) 'updated_at_utc': updatedAtUtc,
      if (createdByUserId != null) 'created_by_user_id': createdByUserId,
      if (updatedByUserId != null) 'updated_by_user_id': updatedByUserId,
      if (rowVersion != null) 'row_version': rowVersion,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAtUtc != null) 'last_synced_at_utc': lastSyncedAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnimalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? farmId,
      Value<String>? tagNumber,
      Value<Gender>? gender,
      Value<String>? breed,
      Value<AnimalStatus>? status,
      Value<Origin>? origin,
      Value<int?>? weightGrams,
      Value<int?>? birthDateUtc,
      Value<String?>? motherId,
      Value<String?>? fatherId,
      Value<String?>? vendorId,
      Value<int?>? purchaseDateUtc,
      Value<int?>? purchasePriceMinor,
      Value<String>? currency,
      Value<int>? createdAtUtc,
      Value<int>? updatedAtUtc,
      Value<String?>? createdByUserId,
      Value<String?>? updatedByUserId,
      Value<int>? rowVersion,
      Value<bool>? isDeleted,
      Value<String>? syncStatus,
      Value<int?>? lastSyncedAtUtc,
      Value<int>? rowid}) {
    return AnimalsCompanion(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      tagNumber: tagNumber ?? this.tagNumber,
      gender: gender ?? this.gender,
      breed: breed ?? this.breed,
      status: status ?? this.status,
      origin: origin ?? this.origin,
      weightGrams: weightGrams ?? this.weightGrams,
      birthDateUtc: birthDateUtc ?? this.birthDateUtc,
      motherId: motherId ?? this.motherId,
      fatherId: fatherId ?? this.fatherId,
      vendorId: vendorId ?? this.vendorId,
      purchaseDateUtc: purchaseDateUtc ?? this.purchaseDateUtc,
      purchasePriceMinor: purchasePriceMinor ?? this.purchasePriceMinor,
      currency: currency ?? this.currency,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      updatedByUserId: updatedByUserId ?? this.updatedByUserId,
      rowVersion: rowVersion ?? this.rowVersion,
      isDeleted: isDeleted ?? this.isDeleted,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAtUtc: lastSyncedAtUtc ?? this.lastSyncedAtUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (farmId.present) {
      map['farm_id'] = Variable<String>(farmId.value);
    }
    if (tagNumber.present) {
      map['tag_number'] = Variable<String>(tagNumber.value);
    }
    if (gender.present) {
      map['gender'] =
          Variable<int>($AnimalsTable.$convertergender.toSql(gender.value));
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (status.present) {
      map['status'] =
          Variable<int>($AnimalsTable.$converterstatus.toSql(status.value));
    }
    if (origin.present) {
      map['origin'] =
          Variable<int>($AnimalsTable.$converterorigin.toSql(origin.value));
    }
    if (weightGrams.present) {
      map['weight_grams'] = Variable<int>(weightGrams.value);
    }
    if (birthDateUtc.present) {
      map['birth_date_utc'] = Variable<int>(birthDateUtc.value);
    }
    if (motherId.present) {
      map['mother_id'] = Variable<String>(motherId.value);
    }
    if (fatherId.present) {
      map['father_id'] = Variable<String>(fatherId.value);
    }
    if (vendorId.present) {
      map['vendor_id'] = Variable<String>(vendorId.value);
    }
    if (purchaseDateUtc.present) {
      map['purchase_date_utc'] = Variable<int>(purchaseDateUtc.value);
    }
    if (purchasePriceMinor.present) {
      map['purchase_price_minor'] = Variable<int>(purchasePriceMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<int>(createdAtUtc.value);
    }
    if (updatedAtUtc.present) {
      map['updated_at_utc'] = Variable<int>(updatedAtUtc.value);
    }
    if (createdByUserId.present) {
      map['created_by_user_id'] = Variable<String>(createdByUserId.value);
    }
    if (updatedByUserId.present) {
      map['updated_by_user_id'] = Variable<String>(updatedByUserId.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAtUtc.present) {
      map['last_synced_at_utc'] = Variable<int>(lastSyncedAtUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnimalsCompanion(')
          ..write('id: $id, ')
          ..write('farmId: $farmId, ')
          ..write('tagNumber: $tagNumber, ')
          ..write('gender: $gender, ')
          ..write('breed: $breed, ')
          ..write('status: $status, ')
          ..write('origin: $origin, ')
          ..write('weightGrams: $weightGrams, ')
          ..write('birthDateUtc: $birthDateUtc, ')
          ..write('motherId: $motherId, ')
          ..write('fatherId: $fatherId, ')
          ..write('vendorId: $vendorId, ')
          ..write('purchaseDateUtc: $purchaseDateUtc, ')
          ..write('purchasePriceMinor: $purchasePriceMinor, ')
          ..write('currency: $currency, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('updatedAtUtc: $updatedAtUtc, ')
          ..write('createdByUserId: $createdByUserId, ')
          ..write('updatedByUserId: $updatedByUserId, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAtUtc: $lastSyncedAtUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CatalogItemsTable extends CatalogItems
    with TableInfo<$CatalogItemsTable, CatalogItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatalogItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _extraMeta = const VerificationMeta('extra');
  @override
  late final GeneratedColumn<String> extra = GeneratedColumn<String>(
      'extra', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _toneMeta = const VerificationMeta('tone');
  @override
  late final GeneratedColumn<String> tone = GeneratedColumn<String>(
      'tone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _rowVersionMeta =
      const VerificationMeta('rowVersion');
  @override
  late final GeneratedColumn<int> rowVersion = GeneratedColumn<int>(
      'row_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtUtcMeta =
      const VerificationMeta('updatedAtUtc');
  @override
  late final GeneratedColumn<int> updatedAtUtc = GeneratedColumn<int>(
      'updated_at_utc', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        category,
        value,
        label,
        extra,
        tone,
        sortOrder,
        isDefault,
        isDeleted,
        syncStatus,
        rowVersion,
        updatedAtUtc
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'catalog_items';
  @override
  VerificationContext validateIntegrity(Insertable<CatalogItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('extra')) {
      context.handle(
          _extraMeta, extra.isAcceptableOrUnknown(data['extra']!, _extraMeta));
    }
    if (data.containsKey('tone')) {
      context.handle(
          _toneMeta, tone.isAcceptableOrUnknown(data['tone']!, _toneMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('row_version')) {
      context.handle(
          _rowVersionMeta,
          rowVersion.isAcceptableOrUnknown(
              data['row_version']!, _rowVersionMeta));
    }
    if (data.containsKey('updated_at_utc')) {
      context.handle(
          _updatedAtUtcMeta,
          updatedAtUtc.isAcceptableOrUnknown(
              data['updated_at_utc']!, _updatedAtUtcMeta));
    } else if (isInserting) {
      context.missing(_updatedAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatalogItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatalogItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      extra: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extra']),
      tone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tone']),
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      rowVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}row_version'])!,
      updatedAtUtc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at_utc'])!,
    );
  }

  @override
  $CatalogItemsTable createAlias(String alias) {
    return $CatalogItemsTable(attachedDatabase, alias);
  }
}

class CatalogItem extends DataClass implements Insertable<CatalogItem> {
  final String id;
  final String category;
  final String value;
  final String label;
  final String? extra;
  final String? tone;
  final int sortOrder;
  final bool isDefault;
  final bool isDeleted;
  final String syncStatus;
  final int rowVersion;
  final int updatedAtUtc;
  const CatalogItem(
      {required this.id,
      required this.category,
      required this.value,
      required this.label,
      this.extra,
      this.tone,
      required this.sortOrder,
      required this.isDefault,
      required this.isDeleted,
      required this.syncStatus,
      required this.rowVersion,
      required this.updatedAtUtc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category'] = Variable<String>(category);
    map['value'] = Variable<String>(value);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || extra != null) {
      map['extra'] = Variable<String>(extra);
    }
    if (!nullToAbsent || tone != null) {
      map['tone'] = Variable<String>(tone);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_default'] = Variable<bool>(isDefault);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['sync_status'] = Variable<String>(syncStatus);
    map['row_version'] = Variable<int>(rowVersion);
    map['updated_at_utc'] = Variable<int>(updatedAtUtc);
    return map;
  }

  CatalogItemsCompanion toCompanion(bool nullToAbsent) {
    return CatalogItemsCompanion(
      id: Value(id),
      category: Value(category),
      value: Value(value),
      label: Value(label),
      extra:
          extra == null && nullToAbsent ? const Value.absent() : Value(extra),
      tone: tone == null && nullToAbsent ? const Value.absent() : Value(tone),
      sortOrder: Value(sortOrder),
      isDefault: Value(isDefault),
      isDeleted: Value(isDeleted),
      syncStatus: Value(syncStatus),
      rowVersion: Value(rowVersion),
      updatedAtUtc: Value(updatedAtUtc),
    );
  }

  factory CatalogItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatalogItem(
      id: serializer.fromJson<String>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      value: serializer.fromJson<String>(json['value']),
      label: serializer.fromJson<String>(json['label']),
      extra: serializer.fromJson<String?>(json['extra']),
      tone: serializer.fromJson<String?>(json['tone']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      rowVersion: serializer.fromJson<int>(json['rowVersion']),
      updatedAtUtc: serializer.fromJson<int>(json['updatedAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'category': serializer.toJson<String>(category),
      'value': serializer.toJson<String>(value),
      'label': serializer.toJson<String>(label),
      'extra': serializer.toJson<String?>(extra),
      'tone': serializer.toJson<String?>(tone),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isDefault': serializer.toJson<bool>(isDefault),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'rowVersion': serializer.toJson<int>(rowVersion),
      'updatedAtUtc': serializer.toJson<int>(updatedAtUtc),
    };
  }

  CatalogItem copyWith(
          {String? id,
          String? category,
          String? value,
          String? label,
          Value<String?> extra = const Value.absent(),
          Value<String?> tone = const Value.absent(),
          int? sortOrder,
          bool? isDefault,
          bool? isDeleted,
          String? syncStatus,
          int? rowVersion,
          int? updatedAtUtc}) =>
      CatalogItem(
        id: id ?? this.id,
        category: category ?? this.category,
        value: value ?? this.value,
        label: label ?? this.label,
        extra: extra.present ? extra.value : this.extra,
        tone: tone.present ? tone.value : this.tone,
        sortOrder: sortOrder ?? this.sortOrder,
        isDefault: isDefault ?? this.isDefault,
        isDeleted: isDeleted ?? this.isDeleted,
        syncStatus: syncStatus ?? this.syncStatus,
        rowVersion: rowVersion ?? this.rowVersion,
        updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
      );
  CatalogItem copyWithCompanion(CatalogItemsCompanion data) {
    return CatalogItem(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      value: data.value.present ? data.value.value : this.value,
      label: data.label.present ? data.label.value : this.label,
      extra: data.extra.present ? data.extra.value : this.extra,
      tone: data.tone.present ? data.tone.value : this.tone,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      rowVersion:
          data.rowVersion.present ? data.rowVersion.value : this.rowVersion,
      updatedAtUtc: data.updatedAtUtc.present
          ? data.updatedAtUtc.value
          : this.updatedAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatalogItem(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('value: $value, ')
          ..write('label: $label, ')
          ..write('extra: $extra, ')
          ..write('tone: $tone, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isDefault: $isDefault, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('updatedAtUtc: $updatedAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, value, label, extra, tone,
      sortOrder, isDefault, isDeleted, syncStatus, rowVersion, updatedAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatalogItem &&
          other.id == this.id &&
          other.category == this.category &&
          other.value == this.value &&
          other.label == this.label &&
          other.extra == this.extra &&
          other.tone == this.tone &&
          other.sortOrder == this.sortOrder &&
          other.isDefault == this.isDefault &&
          other.isDeleted == this.isDeleted &&
          other.syncStatus == this.syncStatus &&
          other.rowVersion == this.rowVersion &&
          other.updatedAtUtc == this.updatedAtUtc);
}

class CatalogItemsCompanion extends UpdateCompanion<CatalogItem> {
  final Value<String> id;
  final Value<String> category;
  final Value<String> value;
  final Value<String> label;
  final Value<String?> extra;
  final Value<String?> tone;
  final Value<int> sortOrder;
  final Value<bool> isDefault;
  final Value<bool> isDeleted;
  final Value<String> syncStatus;
  final Value<int> rowVersion;
  final Value<int> updatedAtUtc;
  final Value<int> rowid;
  const CatalogItemsCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.value = const Value.absent(),
    this.label = const Value.absent(),
    this.extra = const Value.absent(),
    this.tone = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowVersion = const Value.absent(),
    this.updatedAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatalogItemsCompanion.insert({
    required String id,
    required String category,
    required String value,
    required String label,
    this.extra = const Value.absent(),
    this.tone = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowVersion = const Value.absent(),
    required int updatedAtUtc,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        category = Value(category),
        value = Value(value),
        label = Value(label),
        updatedAtUtc = Value(updatedAtUtc);
  static Insertable<CatalogItem> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<String>? value,
    Expression<String>? label,
    Expression<String>? extra,
    Expression<String>? tone,
    Expression<int>? sortOrder,
    Expression<bool>? isDefault,
    Expression<bool>? isDeleted,
    Expression<String>? syncStatus,
    Expression<int>? rowVersion,
    Expression<int>? updatedAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (value != null) 'value': value,
      if (label != null) 'label': label,
      if (extra != null) 'extra': extra,
      if (tone != null) 'tone': tone,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isDefault != null) 'is_default': isDefault,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowVersion != null) 'row_version': rowVersion,
      if (updatedAtUtc != null) 'updated_at_utc': updatedAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatalogItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? category,
      Value<String>? value,
      Value<String>? label,
      Value<String?>? extra,
      Value<String?>? tone,
      Value<int>? sortOrder,
      Value<bool>? isDefault,
      Value<bool>? isDeleted,
      Value<String>? syncStatus,
      Value<int>? rowVersion,
      Value<int>? updatedAtUtc,
      Value<int>? rowid}) {
    return CatalogItemsCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      value: value ?? this.value,
      label: label ?? this.label,
      extra: extra ?? this.extra,
      tone: tone ?? this.tone,
      sortOrder: sortOrder ?? this.sortOrder,
      isDefault: isDefault ?? this.isDefault,
      isDeleted: isDeleted ?? this.isDeleted,
      syncStatus: syncStatus ?? this.syncStatus,
      rowVersion: rowVersion ?? this.rowVersion,
      updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (extra.present) {
      map['extra'] = Variable<String>(extra.value);
    }
    if (tone.present) {
      map['tone'] = Variable<String>(tone.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowVersion.present) {
      map['row_version'] = Variable<int>(rowVersion.value);
    }
    if (updatedAtUtc.present) {
      map['updated_at_utc'] = Variable<int>(updatedAtUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatalogItemsCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('value: $value, ')
          ..write('label: $label, ')
          ..write('extra: $extra, ')
          ..write('tone: $tone, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isDefault: $isDefault, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowVersion: $rowVersion, ')
          ..write('updatedAtUtc: $updatedAtUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AnimalsTable animals = $AnimalsTable(this);
  late final $CatalogItemsTable catalogItems = $CatalogItemsTable(this);
  late final Index idxAnimalsFarmId = Index('idx_animals_farm_id',
      'CREATE INDEX idx_animals_farm_id ON animals (farm_id)');
  late final Index idxAnimalsUpdatedAtUtc = Index('idx_animals_updated_at_utc',
      'CREATE INDEX idx_animals_updated_at_utc ON animals (updated_at_utc)');
  late final Index idxAnimalsSyncStatus = Index('idx_animals_sync_status',
      'CREATE INDEX idx_animals_sync_status ON animals (sync_status)');
  late final Index idxAnimalsIsDeleted = Index('idx_animals_is_deleted',
      'CREATE INDEX idx_animals_is_deleted ON animals (is_deleted)');
  late final Index idxCatalogItemsCategory = Index('idx_catalog_items_category',
      'CREATE INDEX idx_catalog_items_category ON catalog_items (category)');
  late final CatalogDao catalogDao = CatalogDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        animals,
        catalogItems,
        idxAnimalsFarmId,
        idxAnimalsUpdatedAtUtc,
        idxAnimalsSyncStatus,
        idxAnimalsIsDeleted,
        idxCatalogItemsCategory
      ];
}

typedef $$AnimalsTableCreateCompanionBuilder = AnimalsCompanion Function({
  required String id,
  required String farmId,
  required String tagNumber,
  required Gender gender,
  required String breed,
  required AnimalStatus status,
  required Origin origin,
  Value<int?> weightGrams,
  Value<int?> birthDateUtc,
  Value<String?> motherId,
  Value<String?> fatherId,
  Value<String?> vendorId,
  Value<int?> purchaseDateUtc,
  Value<int?> purchasePriceMinor,
  Value<String> currency,
  required int createdAtUtc,
  required int updatedAtUtc,
  Value<String?> createdByUserId,
  Value<String?> updatedByUserId,
  Value<int> rowVersion,
  Value<bool> isDeleted,
  Value<String> syncStatus,
  Value<int?> lastSyncedAtUtc,
  Value<int> rowid,
});
typedef $$AnimalsTableUpdateCompanionBuilder = AnimalsCompanion Function({
  Value<String> id,
  Value<String> farmId,
  Value<String> tagNumber,
  Value<Gender> gender,
  Value<String> breed,
  Value<AnimalStatus> status,
  Value<Origin> origin,
  Value<int?> weightGrams,
  Value<int?> birthDateUtc,
  Value<String?> motherId,
  Value<String?> fatherId,
  Value<String?> vendorId,
  Value<int?> purchaseDateUtc,
  Value<int?> purchasePriceMinor,
  Value<String> currency,
  Value<int> createdAtUtc,
  Value<int> updatedAtUtc,
  Value<String?> createdByUserId,
  Value<String?> updatedByUserId,
  Value<int> rowVersion,
  Value<bool> isDeleted,
  Value<String> syncStatus,
  Value<int?> lastSyncedAtUtc,
  Value<int> rowid,
});

class $$AnimalsTableFilterComposer
    extends Composer<_$AppDatabase, $AnimalsTable> {
  $$AnimalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get farmId => $composableBuilder(
      column: $table.farmId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tagNumber => $composableBuilder(
      column: $table.tagNumber, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Gender, Gender, int> get gender =>
      $composableBuilder(
          column: $table.gender,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AnimalStatus, AnimalStatus, int> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Origin, Origin, int> get origin =>
      $composableBuilder(
          column: $table.origin,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get weightGrams => $composableBuilder(
      column: $table.weightGrams, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get birthDateUtc => $composableBuilder(
      column: $table.birthDateUtc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get motherId => $composableBuilder(
      column: $table.motherId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fatherId => $composableBuilder(
      column: $table.fatherId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vendorId => $composableBuilder(
      column: $table.vendorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchaseDateUtc => $composableBuilder(
      column: $table.purchaseDateUtc,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchasePriceMinor => $composableBuilder(
      column: $table.purchasePriceMinor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAtUtc => $composableBuilder(
      column: $table.updatedAtUtc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedByUserId => $composableBuilder(
      column: $table.updatedByUserId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rowVersion => $composableBuilder(
      column: $table.rowVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastSyncedAtUtc => $composableBuilder(
      column: $table.lastSyncedAtUtc,
      builder: (column) => ColumnFilters(column));
}

class $$AnimalsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnimalsTable> {
  $$AnimalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get farmId => $composableBuilder(
      column: $table.farmId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tagNumber => $composableBuilder(
      column: $table.tagNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weightGrams => $composableBuilder(
      column: $table.weightGrams, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get birthDateUtc => $composableBuilder(
      column: $table.birthDateUtc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get motherId => $composableBuilder(
      column: $table.motherId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fatherId => $composableBuilder(
      column: $table.fatherId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vendorId => $composableBuilder(
      column: $table.vendorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchaseDateUtc => $composableBuilder(
      column: $table.purchaseDateUtc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchasePriceMinor => $composableBuilder(
      column: $table.purchasePriceMinor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAtUtc => $composableBuilder(
      column: $table.updatedAtUtc,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedByUserId => $composableBuilder(
      column: $table.updatedByUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rowVersion => $composableBuilder(
      column: $table.rowVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastSyncedAtUtc => $composableBuilder(
      column: $table.lastSyncedAtUtc,
      builder: (column) => ColumnOrderings(column));
}

class $$AnimalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnimalsTable> {
  $$AnimalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get farmId =>
      $composableBuilder(column: $table.farmId, builder: (column) => column);

  GeneratedColumn<String> get tagNumber =>
      $composableBuilder(column: $table.tagNumber, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Gender, int> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AnimalStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Origin, int> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<int> get weightGrams => $composableBuilder(
      column: $table.weightGrams, builder: (column) => column);

  GeneratedColumn<int> get birthDateUtc => $composableBuilder(
      column: $table.birthDateUtc, builder: (column) => column);

  GeneratedColumn<String> get motherId =>
      $composableBuilder(column: $table.motherId, builder: (column) => column);

  GeneratedColumn<String> get fatherId =>
      $composableBuilder(column: $table.fatherId, builder: (column) => column);

  GeneratedColumn<String> get vendorId =>
      $composableBuilder(column: $table.vendorId, builder: (column) => column);

  GeneratedColumn<int> get purchaseDateUtc => $composableBuilder(
      column: $table.purchaseDateUtc, builder: (column) => column);

  GeneratedColumn<int> get purchasePriceMinor => $composableBuilder(
      column: $table.purchasePriceMinor, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get createdAtUtc => $composableBuilder(
      column: $table.createdAtUtc, builder: (column) => column);

  GeneratedColumn<int> get updatedAtUtc => $composableBuilder(
      column: $table.updatedAtUtc, builder: (column) => column);

  GeneratedColumn<String> get createdByUserId => $composableBuilder(
      column: $table.createdByUserId, builder: (column) => column);

  GeneratedColumn<String> get updatedByUserId => $composableBuilder(
      column: $table.updatedByUserId, builder: (column) => column);

  GeneratedColumn<int> get rowVersion => $composableBuilder(
      column: $table.rowVersion, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<int> get lastSyncedAtUtc => $composableBuilder(
      column: $table.lastSyncedAtUtc, builder: (column) => column);
}

class $$AnimalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AnimalsTable,
    Animal,
    $$AnimalsTableFilterComposer,
    $$AnimalsTableOrderingComposer,
    $$AnimalsTableAnnotationComposer,
    $$AnimalsTableCreateCompanionBuilder,
    $$AnimalsTableUpdateCompanionBuilder,
    (Animal, BaseReferences<_$AppDatabase, $AnimalsTable, Animal>),
    Animal,
    PrefetchHooks Function()> {
  $$AnimalsTableTableManager(_$AppDatabase db, $AnimalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnimalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnimalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnimalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> farmId = const Value.absent(),
            Value<String> tagNumber = const Value.absent(),
            Value<Gender> gender = const Value.absent(),
            Value<String> breed = const Value.absent(),
            Value<AnimalStatus> status = const Value.absent(),
            Value<Origin> origin = const Value.absent(),
            Value<int?> weightGrams = const Value.absent(),
            Value<int?> birthDateUtc = const Value.absent(),
            Value<String?> motherId = const Value.absent(),
            Value<String?> fatherId = const Value.absent(),
            Value<String?> vendorId = const Value.absent(),
            Value<int?> purchaseDateUtc = const Value.absent(),
            Value<int?> purchasePriceMinor = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<int> createdAtUtc = const Value.absent(),
            Value<int> updatedAtUtc = const Value.absent(),
            Value<String?> createdByUserId = const Value.absent(),
            Value<String?> updatedByUserId = const Value.absent(),
            Value<int> rowVersion = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int?> lastSyncedAtUtc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnimalsCompanion(
            id: id,
            farmId: farmId,
            tagNumber: tagNumber,
            gender: gender,
            breed: breed,
            status: status,
            origin: origin,
            weightGrams: weightGrams,
            birthDateUtc: birthDateUtc,
            motherId: motherId,
            fatherId: fatherId,
            vendorId: vendorId,
            purchaseDateUtc: purchaseDateUtc,
            purchasePriceMinor: purchasePriceMinor,
            currency: currency,
            createdAtUtc: createdAtUtc,
            updatedAtUtc: updatedAtUtc,
            createdByUserId: createdByUserId,
            updatedByUserId: updatedByUserId,
            rowVersion: rowVersion,
            isDeleted: isDeleted,
            syncStatus: syncStatus,
            lastSyncedAtUtc: lastSyncedAtUtc,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String farmId,
            required String tagNumber,
            required Gender gender,
            required String breed,
            required AnimalStatus status,
            required Origin origin,
            Value<int?> weightGrams = const Value.absent(),
            Value<int?> birthDateUtc = const Value.absent(),
            Value<String?> motherId = const Value.absent(),
            Value<String?> fatherId = const Value.absent(),
            Value<String?> vendorId = const Value.absent(),
            Value<int?> purchaseDateUtc = const Value.absent(),
            Value<int?> purchasePriceMinor = const Value.absent(),
            Value<String> currency = const Value.absent(),
            required int createdAtUtc,
            required int updatedAtUtc,
            Value<String?> createdByUserId = const Value.absent(),
            Value<String?> updatedByUserId = const Value.absent(),
            Value<int> rowVersion = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int?> lastSyncedAtUtc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnimalsCompanion.insert(
            id: id,
            farmId: farmId,
            tagNumber: tagNumber,
            gender: gender,
            breed: breed,
            status: status,
            origin: origin,
            weightGrams: weightGrams,
            birthDateUtc: birthDateUtc,
            motherId: motherId,
            fatherId: fatherId,
            vendorId: vendorId,
            purchaseDateUtc: purchaseDateUtc,
            purchasePriceMinor: purchasePriceMinor,
            currency: currency,
            createdAtUtc: createdAtUtc,
            updatedAtUtc: updatedAtUtc,
            createdByUserId: createdByUserId,
            updatedByUserId: updatedByUserId,
            rowVersion: rowVersion,
            isDeleted: isDeleted,
            syncStatus: syncStatus,
            lastSyncedAtUtc: lastSyncedAtUtc,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AnimalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AnimalsTable,
    Animal,
    $$AnimalsTableFilterComposer,
    $$AnimalsTableOrderingComposer,
    $$AnimalsTableAnnotationComposer,
    $$AnimalsTableCreateCompanionBuilder,
    $$AnimalsTableUpdateCompanionBuilder,
    (Animal, BaseReferences<_$AppDatabase, $AnimalsTable, Animal>),
    Animal,
    PrefetchHooks Function()>;
typedef $$CatalogItemsTableCreateCompanionBuilder = CatalogItemsCompanion
    Function({
  required String id,
  required String category,
  required String value,
  required String label,
  Value<String?> extra,
  Value<String?> tone,
  Value<int> sortOrder,
  Value<bool> isDefault,
  Value<bool> isDeleted,
  Value<String> syncStatus,
  Value<int> rowVersion,
  required int updatedAtUtc,
  Value<int> rowid,
});
typedef $$CatalogItemsTableUpdateCompanionBuilder = CatalogItemsCompanion
    Function({
  Value<String> id,
  Value<String> category,
  Value<String> value,
  Value<String> label,
  Value<String?> extra,
  Value<String?> tone,
  Value<int> sortOrder,
  Value<bool> isDefault,
  Value<bool> isDeleted,
  Value<String> syncStatus,
  Value<int> rowVersion,
  Value<int> updatedAtUtc,
  Value<int> rowid,
});

class $$CatalogItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CatalogItemsTable> {
  $$CatalogItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get extra => $composableBuilder(
      column: $table.extra, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tone => $composableBuilder(
      column: $table.tone, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rowVersion => $composableBuilder(
      column: $table.rowVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAtUtc => $composableBuilder(
      column: $table.updatedAtUtc, builder: (column) => ColumnFilters(column));
}

class $$CatalogItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CatalogItemsTable> {
  $$CatalogItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get extra => $composableBuilder(
      column: $table.extra, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tone => $composableBuilder(
      column: $table.tone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rowVersion => $composableBuilder(
      column: $table.rowVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAtUtc => $composableBuilder(
      column: $table.updatedAtUtc,
      builder: (column) => ColumnOrderings(column));
}

class $$CatalogItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatalogItemsTable> {
  $$CatalogItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get extra =>
      $composableBuilder(column: $table.extra, builder: (column) => column);

  GeneratedColumn<String> get tone =>
      $composableBuilder(column: $table.tone, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<int> get rowVersion => $composableBuilder(
      column: $table.rowVersion, builder: (column) => column);

  GeneratedColumn<int> get updatedAtUtc => $composableBuilder(
      column: $table.updatedAtUtc, builder: (column) => column);
}

class $$CatalogItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CatalogItemsTable,
    CatalogItem,
    $$CatalogItemsTableFilterComposer,
    $$CatalogItemsTableOrderingComposer,
    $$CatalogItemsTableAnnotationComposer,
    $$CatalogItemsTableCreateCompanionBuilder,
    $$CatalogItemsTableUpdateCompanionBuilder,
    (
      CatalogItem,
      BaseReferences<_$AppDatabase, $CatalogItemsTable, CatalogItem>
    ),
    CatalogItem,
    PrefetchHooks Function()> {
  $$CatalogItemsTableTableManager(_$AppDatabase db, $CatalogItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatalogItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatalogItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatalogItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<String?> extra = const Value.absent(),
            Value<String?> tone = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowVersion = const Value.absent(),
            Value<int> updatedAtUtc = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CatalogItemsCompanion(
            id: id,
            category: category,
            value: value,
            label: label,
            extra: extra,
            tone: tone,
            sortOrder: sortOrder,
            isDefault: isDefault,
            isDeleted: isDeleted,
            syncStatus: syncStatus,
            rowVersion: rowVersion,
            updatedAtUtc: updatedAtUtc,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String category,
            required String value,
            required String label,
            Value<String?> extra = const Value.absent(),
            Value<String?> tone = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowVersion = const Value.absent(),
            required int updatedAtUtc,
            Value<int> rowid = const Value.absent(),
          }) =>
              CatalogItemsCompanion.insert(
            id: id,
            category: category,
            value: value,
            label: label,
            extra: extra,
            tone: tone,
            sortOrder: sortOrder,
            isDefault: isDefault,
            isDeleted: isDeleted,
            syncStatus: syncStatus,
            rowVersion: rowVersion,
            updatedAtUtc: updatedAtUtc,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CatalogItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CatalogItemsTable,
    CatalogItem,
    $$CatalogItemsTableFilterComposer,
    $$CatalogItemsTableOrderingComposer,
    $$CatalogItemsTableAnnotationComposer,
    $$CatalogItemsTableCreateCompanionBuilder,
    $$CatalogItemsTableUpdateCompanionBuilder,
    (
      CatalogItem,
      BaseReferences<_$AppDatabase, $CatalogItemsTable, CatalogItem>
    ),
    CatalogItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AnimalsTableTableManager get animals =>
      $$AnimalsTableTableManager(_db, _db.animals);
  $$CatalogItemsTableTableManager get catalogItems =>
      $$CatalogItemsTableTableManager(_db, _db.catalogItems);
}
