import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:greendo/features/home/data/models/place_model.dart';
import 'package:greendo/features/home/data/models/review_model.dart';
import 'package:greendo/features/home/presentation/views/widgets/place_image.dart';
import 'package:greendo/features/home/presentation/views/widgets/review_card.dart';
import 'package:greendo/features/home/presentation/views/widgets/silver_app_bar.dart';

import '../../../../core/utils/review_api_service.dart';
import '../../data/repos/review/review_repo_imp.dart';

class DetailView extends StatefulWidget {
  final PlaceModel place;

  const DetailView({super.key, required this.place});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  List<ReviewModel> reviews = [];
  bool isFavorite = false;
  late final ReviewRepoImp reviewRepoImp;

  @override
  void initState() {
    super.initState();
    reviewRepoImp = ReviewRepoImp(ReviewApiService(Dio()));
    fetchReviews();
  }

  void fetchReviews() async {
    var result = await reviewRepoImp.getReviews();
    result.fold(
      (failure) {
        print('❌ Failed to fetch reviews: $failure');
      },
      (fetchedReviews) {
        setState(() {
          reviews = fetchedReviews;
        });
      },
    );
  }

  void toggleLike(int index) {
    setState(() {
      final review = reviews[index];
      if (review.isLiked) {
        review.isLiked = false;
        review.likes = (review.likes ?? 0) - 1;
      } else {
        review.isLiked = true;
        review.likes = (review.likes ?? 0) + 1;
      }
    });
  }

  void toggleDislike(int index) {
    setState(() {
      final review = reviews[index];
      if (review.isDisliked) {
        review.isDisliked = false;
        review.disLikes = (review.disLikes ?? 0) - 1;
      } else {
        review.isDisliked = true;
        review.disLikes = (review.disLikes ?? 0) + 1;
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
    final title = place.title ?? "Unknown Title";
    final city = place.city ?? "Unknown City";
    final rating = place.rating?.toString() ?? "No Rating";
    final description = place.description ?? "No description available.";

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 380,
              pinned: true,
              backgroundColor: Colors.blueGrey,
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
                                style: const TextStyle(fontSize: 14),
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
                      const SizedBox(height: 15),
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
                      const SizedBox(height: 10),
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
                const SizedBox(height: 50),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
