import 'package:flutter/material.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/recommendation_view_body.dart';
import 'custom_choice_chip.dart';

class GroupSelector extends StatelessWidget {
  final TravelGroup? selectedGroup;
  final ValueChanged<TravelGroup> onSelected;

  const GroupSelector({
    Key? key,
    required this.selectedGroup,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: TravelGroup.values.map((group) {
        final isSelected = selectedGroup == group;
        return CustomChoiceChip(
          label: Text(group.label),
          isSelected: isSelected,
          onSelected: (_) => onSelected(group),
        );
      }).toList(),
    );
  }
}