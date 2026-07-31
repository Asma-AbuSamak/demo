import 'package:drift/drift.dart';

@TableIndex(name: 'idx_catalog_items_category', columns: {#category})
class CatalogItems extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  TextColumn get value => text()();
  TextColumn get label => text()();
  TextColumn get extra => text().nullable()();
  TextColumn get tone => text().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  IntColumn get rowVersion => integer().withDefault(const Constant(0))();
  IntColumn get updatedAtUtc => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
