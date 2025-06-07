import 'package:flutter/material.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/travel_step_card.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/warnings_alert_dialog.dart';

import '../../../data/models/travel_step_model.dart';
import '../../../data/models/warning_model.dart';

class RoadMapViewBody extends StatefulWidget {
  const RoadMapViewBody({super.key});

  @override
  State<RoadMapViewBody> createState() => _RoadMapViewBodyState();
}

class _RoadMapViewBodyState extends State<RoadMapViewBody> {
  bool _warningsShown = false;
  List<TravelStepModel> travelSteps = [
    // Add your travel steps here
  ];
  List<WarningModel> warnings = []; // Add your warnings here>
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_warningsShown && warnings.isNotEmpty) {
      _warningsShown = true;

      // Run after first frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showWarningsDialog();
      });
    }
  }

  void _showWarningsDialog() {
    showDialog(
      context: context,
      builder: (context) => WarningsAlertDialog(warnings: warnings),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "🗺️ Your Travel Plan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...travelSteps.map((step) => TravelStepCard(step: step)),
      ],
    );
  }
}
