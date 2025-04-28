import 'package:greendo/features/home/data/models/review_model.dart';

class PlaceModel {
  String? id;
  String? imageUre;
  String? title;
  String? city;
  double? rating;
  String? description;
  int? likes;



  PlaceModel({
    this.id,
    this.imageUre,
    this.title,
    this.city,
    this.rating,
    this.description,
    this.likes,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['place_id'],
      imageUre: json['image_url'],
      likes: json['likes'],
      title: json['name'],
      city: json['location']['city'],
      description: json['description'],
      rating: json['average_rating'].toDouble(),
    );
  }
}
