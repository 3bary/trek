import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class CustomChooseChip extends StatefulWidget {
  const CustomChooseChip({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onChipSelected,
    required this.onChipDeselected,
  });

  final bool isSelected;
  final Widget label;
  final Function() onChipSelected;
  final Function() onChipDeselected;

  @override
  _CustomChooseChipState createState() => _CustomChooseChipState();
}

class _CustomChooseChipState extends State<CustomChooseChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: widget.label,
      selected: widget.isSelected,
      selectedColor: kSecondaryColor,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: widget.isSelected ? Colors.white : Colors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onSelected: (bool selected) {
        setState(() {
          selected ? widget.onChipSelected() : widget.onChipDeselected();
        });
      },
    );
  }
}
