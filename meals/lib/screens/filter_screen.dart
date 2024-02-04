import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _isGlutenFreeSet = false;
  var _isLactoseFreeSet = false;
  var _isVegetarianSet = false;
  var _isVeganSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilter = ref.read(filtersProvider);
    _isGlutenFreeSet = activeFilter[Filter.glutenFree]!;
    _isLactoseFreeSet = activeFilter[Filter.lactoseFfree]!;
    _isVegetarianSet = activeFilter[Filter.vegetarian]!;
    _isVeganSet = activeFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).selectedFilter({
            Filter.glutenFree: _isGlutenFreeSet,
            Filter.lactoseFfree: _isLactoseFreeSet,
            Filter.vegan: _isVeganSet,
            Filter.vegetarian: _isVegetarianSet,
          });
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isGlutenFreeSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _isGlutenFreeSet = isChecked;
                  },
                );
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free food',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 22, right: 22),
            ),
            SwitchListTile(
              value: _isLactoseFreeSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _isLactoseFreeSet = isChecked;
                  },
                );
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free food',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 22, right: 22),
            ),
            SwitchListTile(
              value: _isVeganSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _isVeganSet = isChecked;
                  },
                );
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
              subtitle: Text(
                'Only include vegan food',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 22, right: 22),
            ),
            SwitchListTile(
              value: _isVegetarianSet,
              onChanged: (isChecked) {
                setState(
                  () {
                    _isVegetarianSet = isChecked;
                  },
                );
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian food',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 22, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
