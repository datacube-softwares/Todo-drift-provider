import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_db_test/database/entity/item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(tables: [Items])
class AppDB extends _$AppDB {
  // we tell the database where to store the data with this constructor
  AppDB() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Future<List<Item>> getItems() async {
    log("reading db data");
    return await select(items).get();
  }

  addItems(ItemsCompanion itemsCompanion) async {
    log("adding item to db");
    return await into(items).insert(itemsCompanion);
  }

  setChecked(int itemId) async {
    log("check item from db");
    Item item =
        await (select(items)..where((t) => t.id.equals(itemId))).getSingle();
    bool check = !item.checked;
    (update(items)..where((t) => t.id.equals(itemId)))
        .write(ItemsCompanion(checked: Value(check)));
    return check;
  }

  deleteItems(int itemId) async {
    log("deteting item from db");
    return (delete(items)..where((t) => t.id.equals(itemId))).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
