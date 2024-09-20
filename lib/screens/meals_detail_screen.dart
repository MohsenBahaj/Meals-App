// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Providers/favorite_provider.dart';

import 'package:meal/models/meal.dart';

class MealsDetailsScreen extends ConsumerWidget {
  final Meal meal;
  MealsDetailsScreen({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favmeals = ref.watch(favoriteMealsProvider);
    final bool isFav = favmeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(ref
                      .read(favoriteMealsProvider.notifier)
                      .toggleMealfav(meal))));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                Icons.favorite,
                color: isFav ? Colors.red : Color(0xFFd6c2c3),
                key: ValueKey(isFav),
              ),
            ),
          )
        ],
      ),
      body: bodyContent(meal: meal),
    );
  }
}

class bodyContent extends StatelessWidget {
  const bodyContent({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(
            tag: '${meal.imageUrl}',
            child: Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Ingredients',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          SizedBox(
            height: 14,
          ),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Steps',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          SizedBox(
            height: 14,
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
        ],
      ),
    );
  }
}
