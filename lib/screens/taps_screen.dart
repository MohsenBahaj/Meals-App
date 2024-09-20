import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Providers/favorite_provider.dart';
import 'package:meal/Providers/filter_provider.dart';
import 'package:meal/Providers/nav_bar_provider.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/caterories_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals_screen.dart';
import 'package:meal/widgets/drawer.dart';

class TapsScreen extends ConsumerWidget {
  // Initializing activePageTitle with a default value
  String activePageTitle = 'Categories';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableMeal = ref.watch(filteredMealProvider);

    Widget activePage = CatergoryScreen(availableMeal: availableMeal);
    final _selectedPageIndex = ref.watch(navBarProvider);
    final favMeals = ref.watch(favoriteMealsProvider);
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favMeals,
        title: null,
      );
      activePageTitle = 'Favorites';
    } else {
      activePageTitle = 'Categories';
    }

    return Scaffold(
      drawer: DrawerWidget(
        onSelectScreen: (String identifier) {
          if (identifier == 'filters') {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => FiltersScreen()));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: ref.read(navBarProvider.notifier).selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
          ]),
    );
  }
}
