import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_item.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your filters')),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegetarianFilterSet,
              Filter.vegan: _veganFilterSet,
            });
        },
        child: Column(
          children: [
            FilterItem(
              checked: _glutenFreeFilterSet,
              toggleFilter: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
            ),
            FilterItem(
              checked: _lactoseFreeFilterSet,
              toggleFilter: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
            ),
            FilterItem(
              checked: _vegetarianFilterSet,
              toggleFilter: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: 'Vegetarian filter',
              subtitle: 'Only include vegetarian meals.',
            ),
            FilterItem(
              checked: _veganFilterSet,
              toggleFilter: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: 'Vegan filter',
              subtitle: 'Only include vegan meals.',
            ),
          ],
        ),
      ),
    );
  }
}
