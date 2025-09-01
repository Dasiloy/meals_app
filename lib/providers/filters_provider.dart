import "package:flutter_riverpod/flutter_riverpod.dart";

enum Filter { vegan, gluteinFree, lactoseFree, vegeterian }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
    : super({
        Filter.gluteinFree: false,
        Filter.lactoseFree: false,
        Filter.vegeterian: false,
        Filter.vegan: false,
      });

  setFilter(Filter filter, bool isChecked) {
    state = {...state, filter: isChecked};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
      return FilterNotifier();
    });
