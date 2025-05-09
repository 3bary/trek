class PlaceModel {
  PlaceModel({
    this.location,
    this.id,
    this.name,
    this.category,
    this.tags,
    this.description,
    this.accessibility,
    this.averageRating,
    this.likes,
    this.reviewsCount,
    this.appropriateTime,
    this.budget,
    this.groupType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
    this.imageUrl,
  });

  PlaceModel.fromJson(dynamic json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['_id'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['place_id'];
    name = json['name'];
    category = json['category'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    description = json['description'];
    accessibility =
        json['accessibility'] != null
            ? json['accessibility'].cast<String>()
            : [];
    averageRating = json['average_rating'].toDouble();
    accessibility = json['accessibility'] != null ? json['accessibility'].cast<String>() : [];
    averageRating = json['average_rating'].toDouble();
    likes = json['likes'];
    reviewsCount = json['reviews_count'];
    appropriateTime =
        json['appropriate_time'] != null
            ? json['appropriate_time'].cast<String>()
            : [];
    budget = json['budget'];
    groupType =
        json['group_type'] != null ? json['group_type'].cast<String>() : [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Location? location;
  String? id;
  String? name;
  String? category;
  List<String>? tags;
  String? description;
  List<String>? accessibility;
  num? averageRating;
  int? likes;
  int? reviewsCount;
  List<String>? appropriateTime;
  String? budget;
  List<String>? groupType;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? image;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['tags'] = tags;
    map['description'] = description;
    map['accessibility'] = accessibility;
    map['average_rating'] = averageRating;
    map['likes'] = likes;
    map['reviews_count'] = reviewsCount;
    map['appropriate_time'] = appropriateTime;
    map['budget'] = budget;
    map['group_type'] = groupType;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['__v'] = v;
    map['image'] = image;
    map['image_url'] = imageUrl;
    return map;
  }
}

class Location {
  Location({this.city, this.country, this.latitude, this.longitude});

  Location.fromJson(dynamic json) {
    city = json['city'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  String? city;
  String? country;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['country'] = country;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}
