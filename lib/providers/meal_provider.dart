import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:meals_app/models/meal_model.dart";

final mealProvider = Provider((ref) {
  return Meal.createDummy();
});
