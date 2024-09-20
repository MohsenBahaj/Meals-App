import 'package:flutter/material.dart';
import 'package:meal/screens/filters_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ])),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text('Cooking Up!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary))
              ],
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pop();
              onSelectScreen('meals');
            },
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            leading: Icon(Icons.restaurant),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => FiltersScreen()));
            },
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            leading: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
