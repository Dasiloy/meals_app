import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final filters = ref.watch(filtersProvider);
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
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
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: filters[Filter.gluteinFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.gluteinFree, isChecked);
              },
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Glutten-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              subtitle: Text(
                "Only includes glutten-free foods.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ),
            SwitchListTile(
              value: filters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              subtitle: Text(
                "Only includes lactose-free foods.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ),
            SwitchListTile(
              value: filters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              subtitle: Text(
                "Only includes vegan foods.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ),
            SwitchListTile(
              value: filters[Filter.vegeterian]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegeterian, isChecked);
              },
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
              activeColor: Theme.of(context).colorScheme.tertiary,
              title: Text(
                "Vegeterian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
              subtitle: Text(
                "Only includes vegeterian foods.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:
                      isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
