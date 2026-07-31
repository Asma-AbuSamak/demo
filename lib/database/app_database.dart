import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../app_constants.dart';
import '../models/animal/animal.dart';
import '../utilities/id_generator.dart';
import 'daos/catalog_dao.dart';
import 'tables/animals_table.dart';
import 'tables/catalog_items_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Animals, CatalogItems], daos: [CatalogDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.createTable(catalogItems);
          }
        },
        beforeOpen: (OpeningDetails details) async {
          await _seedCatalogIfEmpty(this);
        },
      );
}

/// يزرع قوائم `AppConstants` في `catalog_items` مرّة واحدة فقط عند فراغ الجدول.
Future<void> _seedCatalogIfEmpty(AppDatabase db) async {
  final isEmpty = await db.select(db.catalogItems).get().then((rows) => rows.isEmpty);
  if (!isEmpty) return;

  final nowUtc = DateTime.now().toUtc().millisecondsSinceEpoch;

  CatalogItemsCompanion row({
    required String category,
    required String value,
    required String label,
    required int sortOrder,
    Map<String, dynamic>? extra,
  }) {
    return CatalogItemsCompanion.insert(
      id: generateUuidV4(),
      category: category,
      value: value,
      label: label,
      sortOrder: Value(sortOrder),
      extra: Value(extra == null ? null : jsonEncode(extra)),
      isDefault: const Value(true),
      syncStatus: const Value('synced'),
      updatedAtUtc: nowUtc,
    );
  }

  List<CatalogItemsCompanion> plainList(String category, List<String> values) {
    return [
      for (var i = 0; i < values.length; i++)
        row(category: category, value: values[i], label: values[i], sortOrder: i),
    ];
  }

  const medicineReasonsDefault = [
    'تجديد الكمية',
    'سحب من الكمية',
    'طلبية جديدة',
    'رصيد افتتاحي',
    'تالف / منتهي',
    'تصحيح جرد',
  ];

  const intervalsDefault = [
    {'val': '3days', 'label': 'كل 3 أيام', 'days': 3},
    {'val': 'week', 'label': 'كل أسبوع', 'days': 7},
    {'val': '2weeks', 'label': 'كل أسبوعين', 'days': 14},
    {'val': 'month', 'label': 'كل شهر', 'days': 30},
    {'val': '3months', 'label': 'كل 3 أشهر', 'days': 90},
    {'val': '6months', 'label': 'كل 6 أشهر', 'days': 180},
    {'val': 'annual', 'label': 'سنوياً', 'days': 365},
  ];

  final rows = <CatalogItemsCompanion>[
    ...plainList('breed', AppConstants.breeds),
    ...plainList('vaccineName', AppConstants.vaccineNamesDefault),
    ...plainList('treatmentName', AppConstants.treatmentNamesDefault),
    ...plainList('diseaseType', AppConstants.diseaseTypesDefault),
    ...plainList('checkupType', AppConstants.checkupTypesDefault),
    ...plainList('deathCause', AppConstants.deathCausesDefault),
    ...plainList('unit', AppConstants.units),
    ...plainList('medicineReason', medicineReasonsDefault),
    for (var i = 0; i < AppConstants.scheduleOptions.length; i++)
      row(
        category: 'schedule',
        value: AppConstants.scheduleOptions[i]['val'] as String,
        label: AppConstants.scheduleOptions[i]['label'] as String,
        sortOrder: i,
        extra: {'months': AppConstants.scheduleOptions[i]['months']},
      ),
    for (var i = 0; i < intervalsDefault.length; i++)
      row(
        category: 'interval',
        value: intervalsDefault[i]['val'] as String,
        label: intervalsDefault[i]['label'] as String,
        sortOrder: i,
        extra: {'days': intervalsDefault[i]['days']},
      ),
  ];

  await db.batch((b) => b.insertAll(db.catalogItems, rows));
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'epya.sqlite'));
    return NativeDatabase.createInBackground(
      file,
      setup: (database) {
        database.execute('PRAGMA journal_mode=WAL;');
      },
    );
  });
}
