import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/features/home/data/models/review_model.dart';
import 'package:greendo/features/home/presentation/view_model/add_interactions/add_interactions_cubit.dart';
import 'package:greendo/features/home/presentation/views/widgets/place_image.dart';
import 'package:greendo/features/home/presentation/views/widgets/review_card.dart';

import '../../../../core/models/place_model.dart';
import '../view_model/add_review_interactions/add_review_interactions_cubit.dart';
import '../view_model/reviews/place_reviews_cubit.dart';

class PlaceDetailsView extends StatefulWidget {
  final PlaceModel place;

  const PlaceDetailsView({super.key, required this.place});

  @override
  _PlaceDetailsViewState createState() => _PlaceDetailsViewState();
}

class _PlaceDetailsViewState extends State<PlaceDetailsView> {
  bool isFavorite = false;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    context.read<PlaceReviewsCubit>().getPlaceReviews(widget.place.id ?? '');
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void toggleLike(int index, List<ReviewModel> reviews) {
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
    final reviewId = reviews[index].id ?? '';
    context.read<AddReviewInteractionsCubit>().likeReview('like', reviewId);
  }

  void toggleDislike(int index, List<ReviewModel> reviews) {
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
    final reviewId = reviews[index].id ?? '';
    context.read<AddReviewInteractionsCubit>().likeReview('dislike', reviewId);
  }

  @override
  Widget build(BuildContext context) {
    final place = widget.place;
    final title = place.name ?? "Unknown Title";
    final city = place.location?.city ?? "Unknown City";
    final rating = place.averageRating?.toString() ?? "No Rating";
    final description = place.description ?? "No description available.";
    print("Image URL: ${widget.place.imageUrl}");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
        ),
        body: Column(
          children: [
            Hero(
              tag: place.id!,
              child: PlaceImage(imageUrl: place.imageUrl ?? ''),
            ),
            Container(
              width: double.infinity,
              color: kPrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
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
                      Row(
                        children: [
                          Text(rating),
                          const SizedBox(width: 4),
                          const Icon(Icons.star, color: Colors.amber),
                        ],
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                            if (isLiked) {
                              widget.place.likes =
                                  (widget.place.likes ?? 0) + 1;
                              context
                                  .read<AddInteractionsCubit>()
                                  .handleInteraction(
                                    widget.place.id ?? '',
                                    'like',
                                  );
                            } else {
                              widget.place.likes =
                                  (widget.place.likes ?? 1) - 1;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Text(widget.place.likes?.toString() ?? '0'),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.thumb_up,
                              color: isLiked ? Colors.blue : Colors.grey,
                              size: 20,
                            ),
                          ],
                        ),
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
                      const SizedBox(height: 10),
                      BlocBuilder<PlaceReviewsCubit, PlaceReviewsState>(
                        builder: (context, state) {
                          if (state is PlaceReviewsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is PlaceReviewsFailure) {
                            return Center(child: Text("Error: ${state.error}"));
                          } else if (state is PlaceReviewsSuccess) {
                            final reviews = state.reviews;
                            if (reviews.isEmpty) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    'No reviews found for this place.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Column(
                              children:
                                  reviews.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final review = entry.value;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      child: ReviewCard(
                                        review: review,
                                        onLike:
                                            () => toggleLike(index, reviews),
                                        onDislike:
                                            () => toggleDislike(index, reviews),
                                      ),
                                    );
                                  }).toList(),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
