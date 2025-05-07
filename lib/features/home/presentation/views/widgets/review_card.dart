import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';
import 'package:greendo/features/home/data/models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
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
      color: kSecondaryColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.userId ?? "Unknown User",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              review.comment ?? "No comment",
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: review.isLiked ? Colors.green : Colors.grey,
                  ),
                  onPressed: onLike,
                ),
                if ((review.likes ?? 0) > 0)
                  Text(
                    '${review.likes}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: review.isDisliked ? Colors.red : Colors.grey,
                  ),
                  onPressed: onDislike,
                ),
                if ((review.disLikes ?? 0) > 0)
                  Text(
                    '${review.disLikes}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
