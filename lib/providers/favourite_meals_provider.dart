import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:meals_app/models/meal_model.dart";

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleMeal(Meal meal) {
    final isPresent = state.contains(meal);
    if (isPresent) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesMealProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
      return FavouriteMealsNotifier();
    });
