import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
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

  void _selectIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _selectScreen(String id) async {
    if (id == 'filter') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return const FilterScreen();
          },
        ),
      );
    } else if (id == 'meals') {
      _selectIndex(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMelasProvider);

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
