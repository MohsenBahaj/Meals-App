// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal/Providers/meals_provider.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widgets/category_grid_item.dart';

class CatergoryScreen extends ConsumerStatefulWidget {
  final List<Meal> availableMeal;
  const CatergoryScreen({
    required this.availableMeal,
  });

  @override
  ConsumerState<CatergoryScreen> createState() =>
      _ConsumerCatergoryScreenState();
}

class _ConsumerCatergoryScreenState extends ConsumerState<CatergoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final availableCategoriesProvider =
        ref.watch(availableCategoriesMealsProvider);
    return AnimatedBuilder(
      animation: _controller,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2),
        children: [
          for (final category in availableCategories)
            CaterdoryGridItems(
              category: category,
              availableMeal: widget.availableMeal,
            )
        ],
      ),
      builder: (ctx, child) => SlideTransition(
        child: child,
        position: Tween(
          begin: Offset(0, 0.3),
          end: Offset(0, 0),
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease)),
      ),
    );
  }
}
