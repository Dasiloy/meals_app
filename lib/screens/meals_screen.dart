import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item_widget.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  const MealsScreen({this.title, required this.meals, super.key});

  Widget _builder(BuildContext ctx, int index) {
    Meal meal = meals[index];
    return MealItem(meal: meal);
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return ListView.builder(itemBuilder: _builder, itemCount: meals.length);
    }

    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color:
                isDarkMode
                    ? Colors.white
                    : Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ),
        foregroundColor:
            isDarkMode
                ? Colors.white
                : Theme.of(context).colorScheme.onTertiaryContainer,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(itemBuilder: _builder, itemCount: meals.length),
    );
  }
}
