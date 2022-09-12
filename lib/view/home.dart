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
              controller: ScrollController(),
              itemBuilder: (context, index) {
                Item currentItem = itemsList[index];
                return ListTile(
                  leading: Checkbox(
                    value: currentItem.checked,
                    onChanged: (value) {
                      context.read<ProviderItem>().setCheckUnckeck(currentItem);
                    },
                  ),
                  title: Text(
                    currentItem.item,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          decoration: currentItem.checked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                  ),
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
            return Center(
              child: Text(
                "No items",
                style: Theme.of(context).textTheme.titleLarge,
              ),
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
