class PlaceCardModel {
  String? imageUre;
  String? title;
  String? city;
  double? rating;
  String? shortDescription;
  String? description;
  String? name;
  String? comment;
  bool? isLiked;
  bool? isDisliked;
  int? likeCount;
  int? dislikeCount;

  PlaceCardModel({
    this.isLiked,
    this.isDisliked,
    this.likeCount,
    this.dislikeCount,
    this.comment,
    this.description,
    this.imageUre,
    this.title,
    this.city,
    this.rating,
    this.shortDescription,
    this.name,
  });
}
