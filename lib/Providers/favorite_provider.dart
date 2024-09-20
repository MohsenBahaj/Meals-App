import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);
  String toggleMealfav(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();

      return '${meal.title} is no longer a favorite.';
    } else {
      state = [...state, meal];
      return '${meal.title} marked as a favorite!';
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
