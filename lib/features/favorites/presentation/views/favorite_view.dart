import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/placeCard.dart';

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
                  likes: place.likes!,
                  title: place.title!,
                  city: place.city!,
                  rating: place.rating!,
                  description: place.description!,
                  onDetailsPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kPlaceDetailsView, extra: place);
                  },
                ),
              );
            }).toList(),
      ),
    );
  }
}
