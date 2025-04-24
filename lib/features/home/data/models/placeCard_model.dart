import 'package:greendo/features/home/data/models/review_model.dart';

class PlaceCardModel {
  String? imageUre;
  String? title;
  String? city;
  double? rating;
  String? shortDescription;
  String? description;
  List<ReviewModel>? reviews;

  PlaceCardModel({
    this.description,
    this.imageUre,
    this.title,
    this.city,
    this.rating,
    this.shortDescription,
    this.reviews,
  });

  factory PlaceCardModel.fromJson(Map<String, dynamic> json) {
    return PlaceCardModel(
      imageUre: json['imageUre'],
      title: json['name'],
      city: json['location']['city'],
      shortDescription: json['description'],
      rating: json['average_rating'].toDouble(),
    );
  }
}
