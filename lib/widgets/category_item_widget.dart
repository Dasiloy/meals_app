import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final void Function() onTapCategory;
  const CategoryItem({
    super.key,
    required this.category,
    required this.onTapCategory,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return InkWell(
      onTap: onTapCategory,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withAlpha(120),
              category.color.withAlpha(240),
            ],
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w500,
            color:
                isDarkMode
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
