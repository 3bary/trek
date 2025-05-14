import 'package:flutter/material.dart';

class MonthSelector extends StatelessWidget {
  final String? selectedMonth;
  final List<String> months;
  final ValueChanged<String?> onChanged;

  const MonthSelector({
    Key? key,
    required this.selectedMonth,
    required this.months,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      hint: const Text("Select Month"),
      value: selectedMonth,
      onChanged: onChanged,
      items: months
          .map((month) => DropdownMenuItem(value: month, child: Text(month)))
          .toList(),
    );
  }
}