import 'package:flutter/material.dart';
import '../../../../core/widgets/place_card.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final places = [];
    return SingleChildScrollView(
      child: Wrap(
        children:
            places.map((place) {
              return SizedBox(
                width: double.infinity,
                child: PlaceCard(
                  place: place,

                ),
              );
            }).toList(),
      ),
    );
  }
}
