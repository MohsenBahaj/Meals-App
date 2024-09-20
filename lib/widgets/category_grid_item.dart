// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';

import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meals_screen.dart';

class CaterdoryGridItems extends StatelessWidget {
  final Category category;
  final List<Meal> availableMeal;
  const CaterdoryGridItems({
    Key? key,
    required this.category,
    required this.availableMeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Meal> filtredMeal = availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  meals: filtredMeal,
                  title: category.title,
                )));
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: mealContainer(category: category),
    );
  }
}

class mealContainer extends StatelessWidget {
  const mealContainer({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: [
          category.color.withOpacity(0.54),
          category.color.withOpacity(0.9),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Text(category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface)),
    );
  }
}
