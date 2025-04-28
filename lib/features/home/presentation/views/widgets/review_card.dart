import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  const ReviewCard({
    super.key,
    required this.review,
    required this.onLike,
    required this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review["name"] ?? "Unknown User",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              review["comment"] ?? "No comment",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 10),
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
                  onPressed: onLike,
                ),
                if (review["likeCount"] > 0)
                  Text(
                    review["likeCount"].toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color:
                        (review["isDisliked"] ?? false)
                            ? Colors.red
                            : Colors.grey,
                  ),
                  onPressed: onDislike,
                ),
                if (review["dislikeCount"] > 0)
                  Text(
                    review["dislikeCount"].toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
