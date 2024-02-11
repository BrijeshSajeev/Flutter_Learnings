import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_cart/data/categories.dart';
import 'package:shopping_cart/model/category.dart';
import 'package:shopping_cart/model/grocery_item.dart';
import 'package:shopping_cart/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  @override
  void initState() {
    super.initState();
    print("object#############");
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https("flutterstarter-c6659-default-rtdb.firebaseio.com",
        'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedList = [];
    for (final item in listData.entries) {
      final Category category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;

      loadedList.add(GroceryItem(
        id: item.key,
        name: item.value['name'],
        quantity: item.value['quantity'],
        category: category,
      ));
    }
    setState(() {
      _groceryItems = loadedList;
    });
  }

  void _addItem() async {
    await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No items is added yet.."),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            setState(() {
              _groceryItems.removeAt(index);
            });
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(
              _groceryItems[index].name,
            ),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery Lists"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
