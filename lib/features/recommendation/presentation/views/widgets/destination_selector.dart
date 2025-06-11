import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_filter_chip.dart';

class DestinationSelector extends StatelessWidget {
  final List<String> destinations;
  final List<String> selectedDestinations;
  final ValueChanged<String> onSelected;
  final ValueChanged<String> onDeselected;

  const DestinationSelector({
    Key? key,
    required this.destinations,
    required this.selectedDestinations,
    required this.onSelected,
    required this.onDeselected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: destinations.map((destination) {
        final isSelected = selectedDestinations.contains(destination);
        return CustomFilterChip(
          label: Text(destination),
          isSelected: isSelected,
          onChipSelected: () {
            if (!isSelected && selectedDestinations.length < 3) {
              onSelected(destination);
            }
          },
          onChipDeselected: () {
            onDeselected(destination);
          },
        );
      }).toList(),
    );
  }
}