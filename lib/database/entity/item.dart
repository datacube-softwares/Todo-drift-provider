import 'package:drift/drift.dart';

@DataClassName('Item')
class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get item => text()();
}
