import 'package:drift_db_test/database/database.dart';
import 'package:flutter/material.dart';

class ProviderItem extends ChangeNotifier {
  AppDB appDB = AppDB();
  List<Item> itemList = [];

  getItems() async {
    List<Item> items = await appDB.getItems();
    itemList = items;

    notifyListeners();
  }

  setItem(ItemsCompanion item) async {
    int id = await appDB.addItems(item);
    Item newItem = Item(id: id, item: item.item.value);
    itemList.add(newItem);

    notifyListeners();
  }

  removeItem(Item item) async {
    appDB.deleteItems(item.id);
    itemList.remove(item);

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    appDB.close();
  }
}
