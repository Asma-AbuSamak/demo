import 'package:drift/drift.dart';

import '../../models/animal/animal.dart';

@TableIndex(name: 'idx_animals_farm_id', columns: {#farmId})
@TableIndex(name: 'idx_animals_updated_at_utc', columns: {#updatedAtUtc})
@TableIndex(name: 'idx_animals_sync_status', columns: {#syncStatus})
@TableIndex(name: 'idx_animals_is_deleted', columns: {#isDeleted})
class Animals extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get tagNumber => text()();
  IntColumn get gender => intEnum<Gender>()();
  TextColumn get breed => text()();
  IntColumn get status => intEnum<AnimalStatus>()();
  IntColumn get origin => intEnum<Origin>()();

  IntColumn get weightGrams => integer().nullable()();
  IntColumn get birthDateUtc => integer().nullable()();
  TextColumn get motherId => text().nullable()();
  TextColumn get fatherId => text().nullable()();
  TextColumn get vendorId => text().nullable()();
  IntColumn get purchaseDateUtc => integer().nullable()();
  IntColumn get purchasePriceMinor => integer().nullable()();
  TextColumn get currency => text().withDefault(const Constant('JOD'))();

  IntColumn get createdAtUtc => integer()();
  IntColumn get updatedAtUtc => integer()();
  TextColumn get createdByUserId => text().nullable()();
  TextColumn get updatedByUserId => text().nullable()();
  IntColumn get rowVersion => integer().withDefault(const Constant(0))();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get lastSyncedAtUtc => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
