import 'package:drift_db_test/controller/provider/provider_item.dart';
import 'package:drift_db_test/database/database.dart';
import 'package:drift_db_test/view/add_new.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderItem>().getItems();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO List"),
      ),
      body: Consumer(
        builder:
            (BuildContext context, ProviderItem providerItem, Widget? child) {
          List<Item> itemsList = providerItem.itemList;

          if (itemsList.isNotEmpty) {
            return ListView.builder(
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                Item currentItem = itemsList[index];
                return ListTile(
                  title: Text(currentItem.item),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ProviderItem>().removeItem(currentItem);
                    },
                    icon: const Icon(Icons.close),
                    splashRadius: 20,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("No items"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewDialog(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
