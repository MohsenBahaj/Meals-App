import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/filters_screen.dart';

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(0);

  void selectPage(int index) {
    state = index;
  }
}

final navBarProvider = StateNotifierProvider<NavBarNotifier, int>((ref) {
  return NavBarNotifier();
});
