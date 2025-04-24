import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/features/home/data/models/placeCard_model.dart';
import 'package:greendo/features/home/presentation/views/widgets/place_image.dart';
import 'package:greendo/features/home/presentation/views/widgets/review_card.dart';

import '../../../../core/utils/constants.dart';

class DetailView extends StatefulWidget {
  final PlaceCardModel place;

  const DetailView({super.key, required this.place});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  List<Map<String, dynamic>> reviews = [];
  List<Map<String, dynamic>> places = [];

  @override
  void initState() {
    super.initState();
    reviews =
        widget.place.reviews
            ?.map(
              (review) =>
          {
            "name": review.name ?? "Unknown User",
            "comment": review.comment ?? "No comment",
            "isLiked": review.isLiked ?? false,
            "likeCount": review.likeCount ?? 0,
            "isDisliked": review.isDisliked ?? false,
            "dislikeCount": review.dislikeCount ?? 0,
          },
        )
            .toList() ??
            [];
  }

  void toggleLike(int index) {
    setState(() {
      if (reviews[index]["isLiked"] == true) {
        reviews[index]["isLiked"] = false;
        reviews[index]["likeCount"]--;
      } else {
        reviews[index]["isLiked"] = true;
        reviews[index]["likeCount"]++;
      }
    });
  }

  void toggleDislike(int index) {
    setState(() {
      if (reviews[index]["isDisliked"] == true) {
        reviews[index]["isDisliked"] = false;
        reviews[index]["dislikeCount"]--;
      } else {
        reviews[index]["isDisliked"] = true;
        reviews[index]["dislikeCount"]++;
      }
    });
  }

  bool isFavorite = false;

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
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 3,
          iconTheme: const IconThemeData(color: Colors.grey),
          title: const Text(
            "Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaceImage(
                  placeUrl: widget.place.imageUre ?? '',
                  placeCardModel: widget.place,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: toggleFavorite,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(city,
                    style: const TextStyle(color: Colors.grey,
                      overflow: TextOverflow.ellipsis,)),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Text(rating),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                const SizedBox(height: 20),

                const Text(
                  "Full Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(description),
                const SizedBox(height: 20),

                const Text(
                  "Reviews:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Column(
                  children:
                  reviews
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> review = entry.value;

                    return ReviewCard(
                      review: review,
                      onLike: () => toggleLike(index),
                      onDislike: () => toggleDislike(index),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
