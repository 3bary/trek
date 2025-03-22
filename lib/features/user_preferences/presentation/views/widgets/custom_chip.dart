import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onChipSelected,
    required this.onChipDeselected,
  });
  final bool isSelected;
  final Widget label;
  final VoidCallback onChipSelected;
  final VoidCallback onChipDeselected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: label,
      selected: isSelected,
      selectedColor: kSecondaryColor,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onSelected: (bool selected) {
        selected ? onChipSelected() : onChipDeselected();
      },
    );
  }
}