import 'package:flutter/material.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/recommendation_view_body.dart';
import '../../../../../core/widgets/custom_filter_chip.dart';

class AccessibilitySelector extends StatelessWidget {
  final List<AccessibilityOption> selectedAccessibility;
  final ValueChanged<AccessibilityOption> onSelected;
  final ValueChanged<AccessibilityOption> onDeselected;

  const AccessibilitySelector({
    Key? key,
    required this.selectedAccessibility,
    required this.onSelected,
    required this.onDeselected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: AccessibilityOption.values.map((option) {
        final isSelected = selectedAccessibility.contains(option);
        return CustomFilterChip(
          isSelected: isSelected,
          label: Text(option.label),
          onChipSelected: () => onSelected(option),
          onChipDeselected: () => onDeselected(option),
        );
      }).toList(),
    );
  }
}