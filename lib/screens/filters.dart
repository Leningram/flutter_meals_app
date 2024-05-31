import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/widgets/filter_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvicer);
    return Scaffold(
      appBar: AppBar(title: const Text('Your filters')),
      body: Column(
        children: [
          FilterItem(
            checked: activeFilters[Filter.glutenFree]!,
            toggleFilter: (isChecked) {
              ref
                  .read(filtersProvicer.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
          ),
          FilterItem(
            checked: activeFilters[Filter.lactoseFree]!,
            toggleFilter: (isChecked) {
              ref
                  .read(filtersProvicer.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          FilterItem(
            checked: activeFilters[Filter.vegetarian]!,
            toggleFilter: (isChecked) {
              ref
                  .read(filtersProvicer.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: 'Vegetarian filter',
            subtitle: 'Only include vegetarian meals.',
          ),
          FilterItem(
            checked: activeFilters[Filter.vegan]!,
            toggleFilter: (isChecked) {
              ref
                  .read(filtersProvicer.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: 'Vegan filter',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
