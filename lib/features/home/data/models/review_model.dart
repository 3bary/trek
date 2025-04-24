class ReviewModel {
  final String name;
  final String comment;
  bool isLiked;
  int likeCount;
  bool isDisliked;
  int dislikeCount;

  ReviewModel({
    required this.name,
    required this.comment,
    this.isLiked = false,
    this.likeCount = 0,
    this.isDisliked = false,
    this.dislikeCount = 0,
  });
}
