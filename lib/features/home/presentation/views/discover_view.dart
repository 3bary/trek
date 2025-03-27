import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/features/home/presentation/views/widgets/placeCard.dart';
import '../../../../core/utils/app_router.dart';
import '../../data/models/placeCard_model.dart';
class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  List<PlaceCardModel> placeCard = [];

  @override
  void initState() {
    placeCard = getCards();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: PlaceCard(
                title: Widget.title!,
                city: placeCard.city!,
                rating: placeCard.rating!,
                shortDescription: placeCard.shortDescription!,
                onDetailsPressed: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kDetailView, extra: placeCard);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


List<PlaceCardModel> getCards() {
  List<PlaceCardModel> card = [];

  PlaceCardModel place = PlaceCardModel();
  place.title = "Beautiful Beach";
  place.city = "Miami";
  place.rating = 4.5;
  place.description = "A picturesque beach with a serene ocean view.";
  place.shortDescription =
  "A wonderful beach with clear water and golden sand.";
  place.name = "Ahlam";
  place.comment = "Amazing place! Totally recommended";
  place.isLiked = true;
  place.isDisliked = false;
  place.likeCount = 10;
  place.dislikeCount = 5;
  card.add(place);

  // =================================================================
  place = PlaceCardModel();
  place.title = "Beautiful Beach";
  place.city = "Miami";
  place.rating = 4.5;
  place.description = "A picturesque beach with a serene ocean view.";
  place.shortDescription =
  "A wonderful beach with clear water and golden sand.";
  place.name = "Gomaa";
  place.comment = "Amazing place! Totally recommended";
  place.isLiked = true;
  place.isDisliked = false;
  place.likeCount = 10;
  place.dislikeCount = 5;
  card.add(place);

  return card;

}
