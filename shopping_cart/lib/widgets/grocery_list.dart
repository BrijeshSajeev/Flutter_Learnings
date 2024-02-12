import 'dart:convert';
import 'dart:io';

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
  String? _error;
  var _isLoading = true;
  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  void _loadItems() async {
    // final url = Uri.https("flutterstarter-c6659-default-rtdb.firebaseio.com",
    //     'shopping-list.json');
    // final response = await http.get(url);
    // if (response.statusCode >= 400) {
    //   setState(() {
    //     _error = 'Failed to load data, status code: ${response.statusCode}';
    //   });
    // }
    // final Map<String, dynamic> listData = json.decode(response.body);
    // final List<GroceryItem> loadedList = [];
    // for (final item in listData.entries) {
    //   final Category category = categories.entries
    //       .firstWhere(
    //           (catItem) => catItem.value.title == item.value['category'])
    //       .value;

    //   loadedList.add(GroceryItem(
    //     id: item.key,
    //     name: item.value['name'],
    //     quantity: item.value['quantity'],
    //     category: category,
    //   ));
    // }
    // setState(() {
    //   _groceryItems = loadedList;
    //   _isLoading = false;
    // });
    try {
      final url = Uri.https("flutterstarter-c6659-default-rtdb.firebaseio.com",
          'shopping-list.json');
      final response = await http.get(url);

      if (response.statusCode == 200) {
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
          _isLoading = false;
        });
      } else {
        throw Exception('${response.statusCode} Failed to load data');
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
      });
    }
  }

  void _addItem() async {
    final addedItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );
    if (addedItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(addedItem);
    });
  }

  void _deleteItem(id) async {
    final url = Uri.https("flutterstarter-c6659-default-rtdb.firebaseio.com",
        'shopping-list/$id.json');
    await http.delete(url);
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No items is added yet.."),
    );

    if (_error != null) {
      _isLoading = false;
      content = Center(
        child: Text(_error!),
      );
    }

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            setState(() {
              _deleteItem(_groceryItems[index].id);
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
