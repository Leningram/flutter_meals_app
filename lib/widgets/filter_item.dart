import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.checked,
    required this.toggleFilter,
    required this.title,
    required this.subtitle,
  });

  final bool checked;
  final void Function(bool isChecked) toggleFilter;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: checked,
      onChanged: (isCheched) {
        toggleFilter(isCheched);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
