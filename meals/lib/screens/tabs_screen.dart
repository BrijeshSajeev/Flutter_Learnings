import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/meal_provider.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFfree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _currentIndex = 0;

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _selectScreen(String id) async {
    if (id == 'filter') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return FilterScreen(
              selectedFilters: _selectedFilters,
            );
          },
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    } else if (id == 'meals') {
      _selectIndex(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final availableMeals = meals.where(
      (meal) {
        if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_selectedFilters[Filter.lactoseFfree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget content = CategoryScreen(
      availableMeals: availableMeals,
    );
    var currenTitle = 'Categories';
    if (_currentIndex == 1) {
      final favMeals = ref.watch(favoriteMealsProvider);
      content = MealsScreen(
        meals: favMeals,
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
