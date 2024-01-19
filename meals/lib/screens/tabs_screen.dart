import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  void _selectIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const CategoryScreen();
    var currenTitle = 'Categories';
    if (_currentIndex == 1) {
      content = MealsScreen(meals: []);
      currenTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(currenTitle),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectIndex,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categorys'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
