import 'package:flutter/material.dart';
import 'package:greendo/features/home/data/models/placeCard_model.dart';

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
              (review) => {
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
          backgroundColor: Color(0xffA8E6CF),
          elevation: 0,
          toolbarHeight: 80,
          title: Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Center(child: Text("Image Placeholder")),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // لضبط التوزيع بين العنوان والأيقونة
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                SizedBox(height: 10),
                Text(city, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(rating),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  "Full Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(description),
                SizedBox(height: 20),

                Text(
                  "Reviews:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                Column(
                  children:
                      reviews.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, dynamic> review = entry.value;

                        return Card(
                          elevation: 2,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review["name"] ?? "Unknown User",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(review["comment"] ?? "No comment"),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color:
                                            (review["isLiked"] ?? false)
                                                ? Colors.green
                                                : Colors.grey,
                                      ),
                                      onPressed: () => toggleLike(index),
                                    ),
                                    review["likeCount"] > 0
                                        ? Text(
                                          review["likeCount"].toString(),
                                          style: TextStyle(fontSize: 16),
                                        )
                                        : SizedBox(),

                                    SizedBox(width: 10),

                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_down,
                                        color:
                                            (review["isDisliked"] ?? false)
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      onPressed: () => toggleDislike(index),
                                    ),
                                    review["dislikeCount"] > 0
                                        ? Text(
                                          review["dislikeCount"].toString(),
                                          style: TextStyle(fontSize: 16),
                                        )
                                        : SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
