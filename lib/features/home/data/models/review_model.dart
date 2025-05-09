class ReviewModel {
  String? id;

  String? placeId;

  String? userId;

  String? comment;

  int? likes;

  int? disLikes;

  bool isLiked;

  bool isDisliked;

  ReviewModel({
    this.id,
    this.placeId,
    this.userId,
    this.comment,
    this.likes,
    this.disLikes,
    this.isLiked = false,
    this.isDisliked = false,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      placeId: json['place_id'],
      userId: json['user_id'],
      comment: json['review_text'],
      likes: json['likes'],
      disLikes: json['dislikes'],
    );
  }
}
