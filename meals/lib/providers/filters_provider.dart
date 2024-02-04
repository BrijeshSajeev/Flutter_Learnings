import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFfree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFfree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void selectedFilter(Map<Filter, bool> filter) {
    state = filter;
  }

  void updateFilter(Filter filter, bool newValue) {
    state = {
      ...state,
      filter: newValue,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);
