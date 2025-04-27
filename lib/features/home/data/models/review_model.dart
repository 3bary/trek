class ReviewModel {
  String? name;
  String? comment;
  int? likes;

  int? disLikes;

  ReviewModel({this.name, this.comment, this.likes, this.disLikes});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['user_id'],
      comment: json['review_text'],
      likes: json['likes'],
      disLikes: json['dislikes'],
    );
  }
}
