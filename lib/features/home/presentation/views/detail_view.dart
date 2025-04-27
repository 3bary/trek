import 'package:flutter/material.dart';
import 'package:greendo/features/home/data/models/place_model.dart';
import 'package:greendo/features/home/presentation/views/widgets/place_image.dart';
import 'package:greendo/features/home/presentation/views/widgets/review_card.dart';

class DetailView extends StatefulWidget {
  final PlaceModel place;

  const DetailView({super.key, required this.place});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  List<Map<String, dynamic>> reviews = [];
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

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
                  return FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    title: Text(
                      textAlign: TextAlign.start,
                      title,
                      style: TextStyle(
                        fontSize: top > 100 ? 18 : 18,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.black54,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    background: Hero(
                      tag:
                          widget.place.id ?? widget.place.title ?? 'defaultTag',
                      child: PlaceImage(
                        imageUrl: widget.place.imageUre ?? '',
                        placeCardModel: widget.place,
                      ),
                    ),

                    collapseMode: CollapseMode.parallax,
                  );
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
                  Map<String, dynamic> review = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ReviewCard(
                      review: review,
                      onLike: () => toggleLike(index),
                      onDislike: () => toggleDislike(index),
                    ),
                  );
                }),
                const SizedBox(height: 250),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
