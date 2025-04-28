import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
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
    return FilterChip(
      label: label,
      selected: isSelected,
      selectedColor: kSecondaryColor,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : kTextColor,
      ),
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
