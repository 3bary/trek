import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final Widget label;

  const CustomChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: label,
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
