import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

import 'package:meals_app/models/meal_model.dart';
import "package:meals_app/providers/favourite_meals_provider.dart";

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdded = ref.watch(favouritesMealProvider).contains(meal);
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            title: Text(
              meal.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  final isAdded = ref
                      .read(favouritesMealProvider.notifier)
                      .toggleMeal(meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isAdded
                            ? "Meal added to favourite"
                            : "Meal removed from favourite",
                      ),
                    ),
                  );
                },
                icon: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, controller) {
                    return RotationTransition(
                      turns: Tween(begin: 0.8, end: 1.0).animate(controller),
                      child: child,
                    );
                  },
                  child: Icon(
                    isAdded ? Icons.star : Icons.star_border_outlined,
                    color: isAdded ? Colors.red : Colors.white,
                    size: 32,
                    key: ValueKey(isAdded),
                  ),
                ),
              ),
            ],
            foregroundColor: Colors.white,
            backgroundColor: Colors.black54,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: meal.id,
                    child: Image.network(meal.imageUrl, fit: BoxFit.cover),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black54, Colors.transparent],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final ing in meal.ingredients)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                      child: Text(
                        ing,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color:
                              isDarkMode
                                  ? Colors.white
                                  : Theme.of(
                                    context,
                                  ).colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    "Steps",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final step in meal.steps)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: Text(
                        step,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color:
                              isDarkMode
                                  ? Colors.white
                                  : Theme.of(
                                    context,
                                  ).colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
