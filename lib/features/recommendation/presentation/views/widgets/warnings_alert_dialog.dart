import 'package:flutter/material.dart';

import '../../../data/models/warning_model.dart';

class WarningsAlertDialog extends StatelessWidget {
  const WarningsAlertDialog({super.key, required this.warnings});
  final List<WarningModel> warnings;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Warnings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: warnings.length,
          itemBuilder: (context, index) {
            final warning = warnings[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.error_outline, color: Colors.orange),
              title: Text(
                warning.message!,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text("Close"),
          ),
        ),
      ],
    );
  }
}
