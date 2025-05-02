import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/features/home/data/models/review_model.dart';
import 'package:greendo/features/home/presentation/views/widgets/review_card.dart';
import 'package:greendo/features/home/presentation/views/widgets/silver_app_bar.dart';
import '../../../../core/models/place_model.dart';
import '../../../../core/network/core_api_service.dart';
import '../../data/repos/home/home_repo_imp.dart';


class PlaceDetailsView extends StatefulWidget {
  final PlaceModel place;

  const PlaceDetailsView({super.key, required this.place});

  @override
  _PlaceDetailsViewState createState() => _PlaceDetailsViewState();
}

class _PlaceDetailsViewState extends State<PlaceDetailsView> {
  List<ReviewModel> reviews = [];
  bool isFavorite = false;
  late final HomeRepoImp homeRepoImp;

  void fetchReviews() async {

    final placeId = widget.place.id ?? 'defaultPlaceId';

    var result = await homeRepoImp.(placeId);
    result.fold(
      (failure) {
        print('Failed to load reviews: $failure');
      },
      (fetchedReviews) {
        setState(() {
          reviews = fetchedReviews;
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();
    reviewRepoImp = ReviewRepoImp(CoreApiService(Dio()));
    fetchReviews();
  }

  void toggleLike(int index) {
    setState(() {
      final review = reviews[index];

      if (review.isLiked) {
        review.isLiked = false;
        review.likes = (review.likes ?? 1) - 1;
      } else {
        review.isLiked = true;
        review.likes = (review.likes ?? 0) + 1;

        if (review.isDisliked) {
          review.isDisliked = false;
          review.disLikes = (review.disLikes ?? 1) - 1;
        }
      }
    });
  }

  void toggleDislike(int index) {
    setState(() {
      final review = reviews[index];

      if (review.isDisliked) {
        review.isDisliked = false;
        review.disLikes = (review.disLikes ?? 1) - 1;
      } else {
        review.isDisliked = true;
        review.disLikes = (review.disLikes ?? 0) + 1;

        if (review.isLiked) {
          review.isLiked = false;
          review.likes = (review.likes ?? 1) - 1;
        }
      }
    });
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final place = widget.place;
    final title = place.name ?? "Unknown Title";
    final city = place.location?.city ?? "Unknown City";
    final rating = place.averageRating?.toString() ?? "No Rating";
    final description = place.description ?? "No description available.";

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 450,
              backgroundColor: kSecondaryColor,
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final top = constraints.biggest.height;
                  return SilverAppBar(title: title, top: top, widget: widget);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: toggleFavorite,
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(rating),
                              const SizedBox(width: 4),
                              const Icon(Icons.star, color: Colors.amber),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                widget.place.likes?.toString() ?? '0',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kTextColor,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.thumb_up,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Description : ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(description),
                      const SizedBox(height: 20),
                      const Text(
                        "Reviews:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ...reviews.asMap().entries.map((entry) {
                  int index = entry.key;
                  ReviewModel review = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ReviewCard(
                      review: {
                        "comment": review.comment ?? '',
                        "likeCount": review.likes ?? 0,
                        "dislikeCount": review.disLikes ?? 0,
                        "isLiked": review.isLiked,
                        "isDisliked": review.isDisliked,
                      },
                      onLike: () => toggleLike(index),
                      onDislike: () => toggleDislike(index),
                    ),
                  );
                }),
                const SizedBox(height: 1),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
