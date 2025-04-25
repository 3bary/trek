import 'package:greendo/features/home/data/models/review_model.dart';

class PlaceModel {
  String? imageUre;
  String? title;
  String? city;
  double? rating;
  String? shortDescription;
  String? description;
  List<ReviewModel>? reviews;

  PlaceModel({
    this.description,
    this.imageUre,
    this.title,
    this.city,
    this.rating,
    this.shortDescription,
    this.reviews,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      imageUre: json['imageUre'],
      title: json['name'],
      city: json['location']['city'],
      shortDescription: json['description'],
      rating: json['average_rating'].toDouble(),
    );
  }
}
