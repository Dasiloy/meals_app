import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_item_widget.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> meals;
  const CategoriesScreen({super.key, required this.meals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _categories = Category.createDummy();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: Duration(milliseconds: 300),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapCategory(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(
            title: category.title,
            meals:
                widget.meals
                    .where((meal) => meal.categories.contains(category.id))
                    .toList(),
          );
        },
      ),
    ); // also written as Navigator.push(contextr,route)
  }

  Widget _builder(BuildContext context, int index) {
    final Category category = _categories[index];
    return CategoryItem(
      category: category,
      onTapCategory: () {
        _onTapCategory(context, category);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.bounceInOut,
            ),
          ),
          child: child,
        );
      },
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: _categories.length,
        itemBuilder: _builder,
      ),
    );
  }
}
