import 'package:flutter/material.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/recommendation_view_body.dart';
import 'custom_choice_chip.dart';

class BudgetSelector extends StatelessWidget {
  final BudgetLevel? selectedBudget;
  final ValueChanged<BudgetLevel> onSelected;

  const BudgetSelector({
    Key? key,
    required this.selectedBudget,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: BudgetLevel.values.map((budget) {
        final isSelected = selectedBudget == budget;
        return CustomChoiceChip(
          label: Text(budget.label),
          isSelected: isSelected,
          onSelected: (_) => onSelected(budget),
        );
      }).toList(),
    );
  }
}