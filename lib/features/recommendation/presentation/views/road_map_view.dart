import 'package:flutter/material.dart';
import 'package:greendo/features/recommendation/presentation/views/widgets/road_map_view_body.dart';

import '../../../../core/utils/constants.dart';

class RoadMapView extends StatelessWidget {
  const RoadMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Road Map'),
          backgroundColor: kPrimaryColor,
        ),
        body: RoadMapViewBody()
      ),
    );
  }
}
