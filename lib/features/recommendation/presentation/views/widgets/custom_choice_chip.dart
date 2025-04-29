
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.isSelected,
    required this.label,
    this.onSelected,
  });

  final bool isSelected;
  final Widget label;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: label,
      selected: isSelected,
      selectedColor: kSecondaryColor,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onSelected: onSelected,
    );
  }
}
