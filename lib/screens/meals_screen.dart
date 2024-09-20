import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meals_detail_screen.dart';
import 'package:meal/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  const MealsScreen({
    super.key,
    required this.meals,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context));
  }

  SingleChildScrollView content(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
                  meal: meal,
                  title: meal.title,
                  imageUrl: meal.imageUrl,
                  duration: meal.duration,
                  complexity: meal.complexity,
                  affordability: meal.affordability,
                  onSelectMeal: (Meal meal) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => MealsDetailsScreen(
                              meal: meal,
                            )));
                  },
                ))
            .toList(),
      ),
    );
  }
}
