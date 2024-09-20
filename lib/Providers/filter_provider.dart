import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/filters_screen.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.gluten: false,
          Filter.lact: false,
          Filter.vegan: false,
          Filter.vegetrian: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealProvider = Provider((ref) {
  final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);

  return dummyMeals.where((meal) {
    if (activeFilters[Filter.gluten]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lact]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[Filter.vegetrian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
