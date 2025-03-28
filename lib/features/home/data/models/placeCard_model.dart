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
}
