// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:drift_db_test/database/database.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

//  _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   final db = LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
//   return db;
// }
