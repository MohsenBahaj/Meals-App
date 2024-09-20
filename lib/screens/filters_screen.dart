import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Providers/filter_provider.dart';

enum Filter { gluten, lact, vegan, vegetrian }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.gluten]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.gluten, value);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.lact]!,
            onChanged: (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lact, value);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.vegan]!,
            onChanged: (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: activeFilters[Filter.vegetrian]!,
            onChanged: (bool value) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetrian, value);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
