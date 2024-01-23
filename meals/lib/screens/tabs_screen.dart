import 'package:flutter/material.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavorite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage("Meal is removed from Fav!");
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage("Added meal to the fav!");
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(message),
    ));
  }

  void _selectIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _selectScreen(String id) {
    if (id == 'filter') {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return const FilterScreen();
      }));
    } else if (id == 'meals') {
      _selectIndex(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CategoryScreen(
      onToggleMealFav: _toggleMealFavorite,
    );
    var currenTitle = 'Categories';
    if (_currentIndex == 1) {
      content = MealsScreen(
        meals: _favoriteMeals,
        onToggleMealFav: _toggleMealFavorite,
      );
      currenTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(currenTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _selectScreen),
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
