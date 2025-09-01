import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';

import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int activeIndex = 0;

  void _onTap(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  List<Meal> _applyFilters(List<Meal> meals, Map<Filter, bool> filters) {
    var filteredMeals = meals;

    // IF GLUTEIN-FREE
    if (filters[Filter.gluteinFree]!) {
      filteredMeals =
          filteredMeals.where((m) {
            return m.isGlutenFree;
          }).toList();
    }

    // IF LACTOSE-FREE
    if (filters[Filter.lactoseFree]!) {
      filteredMeals =
          filteredMeals.where((m) {
            return m.isLactoseFree;
          }).toList();
    }

    // IF VEGETERIAN
    if (filters[Filter.vegeterian]!) {
      filteredMeals =
          filteredMeals.where((m) {
            return m.isVegetarian;
          }).toList();
    }

    // IF VEGAN
    if (filters[Filter.vegan]!) {
      filteredMeals =
          filteredMeals.where((m) {
            return m.isVegan;
          }).toList();
    }

    return filteredMeals;
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filtersProvider);
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final meals = ref.watch(mealProvider);
    String title = "Categories";
    Widget body = CategoriesScreen(meals: _applyFilters(meals, filters));

    if (activeIndex == 1) {
      final favouriteMeals = ref.watch(favouritesMealProvider);
      title = "Favourites";
      body = MealsScreen(meals: _applyFilters(favouriteMeals, filters));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsetsGeometry.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withAlpha(238),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.set_meal_sharp,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: 18),
                  Text(
                    "Eat Up!!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.restaurant, color: Colors.white, size: 18),
              title: Text(
                "Meals",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                Navigator.of(context).pop();
                Navigator.of(context).push<Map<Filter, bool>>(
                  MaterialPageRoute(builder: (ctx) => FilterScreen()),
                );
              },
              leading: Icon(Icons.settings, color: Colors.white, size: 18),
              title: Text(
                "Filters",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
        elevation: 2,
        onTap: _onTap,
        currentIndex: activeIndex,
      ),
    );
  }
}
