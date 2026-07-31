import 'package:drift/drift.dart';

import '../../utilities/id_generator.dart';
import '../app_database.dart';
import '../tables/catalog_items_table.dart';

part 'catalog_dao.g.dart';

@DriftAccessor(tables: [CatalogItems])
class CatalogDao extends DatabaseAccessor<AppDatabase> with _$CatalogDaoMixin {
  CatalogDao(super.db);

  Stream<List<CatalogItem>> watchByCategory(String category) {
    final query = select(catalogItems)
      ..where((t) => t.category.equals(category) & t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]);
    return query.watch();
  }

  Future<void> addItem({
    required String category,
    required String value,
    required String label,
    String? extra,
    String? tone,
    int sortOrder = 0,
  }) {
    final nowUtc = DateTime.now().toUtc().millisecondsSinceEpoch;
    return into(catalogItems).insert(CatalogItemsCompanion.insert(
      id: generateUuidV4(),
      category: category,
      value: value,
      label: label,
      extra: Value(extra),
      tone: Value(tone),
      sortOrder: Value(sortOrder),
      isDefault: const Value(false),
      syncStatus: const Value('pending'),
      updatedAtUtc: nowUtc,
    ));
  }

  Future<void> updateItem(CatalogItem item) {
    final nowUtc = DateTime.now().toUtc().millisecondsSinceEpoch;
    return (update(catalogItems)..where((t) => t.id.equals(item.id))).write(
      CatalogItemsCompanion(
        value: Value(item.value),
        label: Value(item.label),
        extra: Value(item.extra),
        tone: Value(item.tone),
        sortOrder: Value(item.sortOrder),
        syncStatus: const Value('pending'),
        rowVersion: Value(item.rowVersion + 1),
        updatedAtUtc: Value(nowUtc),
      ),
    );
  }

  Future<void> softDelete(String id) async {
    final current = await (select(catalogItems)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (current == null) return;

    final nowUtc = DateTime.now().toUtc().millisecondsSinceEpoch;
    await (update(catalogItems)..where((t) => t.id.equals(id))).write(
      CatalogItemsCompanion(
        isDeleted: const Value(true),
        syncStatus: const Value('pending'),
        rowVersion: Value(current.rowVersion + 1),
        updatedAtUtc: Value(nowUtc),
      ),
    );
  }
}
