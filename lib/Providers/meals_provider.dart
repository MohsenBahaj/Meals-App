import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/data/dummy_data.dart';

final availableCategoriesMealsProvider = Provider((ref) {
  return availableCategories;
});
