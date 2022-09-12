import 'package:drift/drift.dart' as drift;
import 'package:drift_db_test/controller/provider/provider_item.dart';
import 'package:drift_db_test/database/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

addNewDialog(BuildContext context) {
  final ctrlItem = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Add Item"),
            TextField(
              controller: ctrlItem,
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (ctrlItem.text.trim().isEmpty) {
                SnackBar snackBar = const SnackBar(content: Text("Enter Item"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return;
              }

              ItemsCompanion itemsCompanion = ItemsCompanion(
                item: drift.Value(ctrlItem.text.trim()),
              );

              context.read<ProviderItem>().setItem(itemsCompanion);
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}
