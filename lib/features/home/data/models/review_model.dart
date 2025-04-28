class ReviewModel {
  String? id;
  String? name; // هنا المفروض user name مش place_id
  String? comment;
  int? likes;
  int? disLikes;

  bool isLiked; // محلية (مش جاية من API)
  bool isDisliked; // محلية

  ReviewModel({
    this.id,
    this.name,
    this.comment,
    this.likes,
    this.disLikes,
    this.isLiked = false,
    this.isDisliked = false,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['place_id'],
      name: json['user_id'],
      comment: json['review_text'],
      likes: json['likes'],
      disLikes: json['dislikes'],
    );
  }
}
