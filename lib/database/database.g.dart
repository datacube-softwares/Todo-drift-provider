// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Item extends DataClass implements Insertable<Item> {
  final int id;
  final String item;
  const Item({required this.id, required this.item});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item'] = Variable<String>(item);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      item: Value(item),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      item: serializer.fromJson<String>(json['item']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'item': serializer.toJson<String>(item),
    };
  }

  Item copyWith({int? id, String? item}) => Item(
        id: id ?? this.id,
        item: item ?? this.item,
      );
  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, item);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item && other.id == this.id && other.item == this.item);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> item;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.item = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String item,
  }) : item = Value(item);
  static Insertable<Item> custom({
    Expression<int>? id,
    Expression<String>? item,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (item != null) 'item': item,
    });
  }

  ItemsCompanion copyWith({Value<int>? id, Value<String>? item}) {
    return ItemsCompanion(
      id: id ?? this.id,
      item: item ?? this.item,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (item.present) {
      map['item'] = Variable<String>(item.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _itemMeta = const VerificationMeta('item');
  @override
  late final GeneratedColumn<String> item = GeneratedColumn<String>(
      'item', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, item];
  @override
  String get aliasedName => _alias ?? 'items';
  @override
  String get actualTableName => 'items';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item']!, _itemMeta));
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      item: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}item'])!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDB extends GeneratedDatabase {
  _$AppDB(QueryExecutor e) : super(e);
  late final $ItemsTable items = $ItemsTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [items];
}
