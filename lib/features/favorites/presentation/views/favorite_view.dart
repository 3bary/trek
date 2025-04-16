import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/presentation/views/widgets/placeCard.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children:
            AppConstants.places.map((place) {
              return SizedBox(
                width: double.infinity,
                child: PlaceCard(
                  title: place.title!,
                  city: place.city!,
                  rating: place.rating!,
                  shortDescription: place.shortDescription!,
                  onDetailsPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kDetailView, extra: place);
                  },
                ),
              );
            }).toList(),
      ),
    );
  }
}
