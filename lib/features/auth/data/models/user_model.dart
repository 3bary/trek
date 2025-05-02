class UserModel {
  UserModel({
      this.preferences, 
      this.id, 
      this.name, 
      this.role, 
      this.savedPlaces,});

  UserModel.fromJson(dynamic json) {
    preferences = json['preferences'] != null ? Preferences.fromJson(json['preferences']) : null;
    id = json['_id'];
    name = json['name'];
    role = json['role'];
    savedPlaces = json['saved_places'] != null ? json['saved_places'].cast<String>() : [];
  }
  Preferences? preferences;
  String? id;
  String? name;
  String? role;
  List<String>? savedPlaces;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (preferences != null) {
      map['preferences'] = preferences?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['role'] = role;
    map['saved_places'] = savedPlaces;
    return map;
  }

}

class Preferences {
  Preferences({
      this.categories, 
      this.tags,});

  Preferences.fromJson(dynamic json) {
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
  List<String>? categories;
  List<String>? tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categories'] = categories;
    map['tags'] = tags;
    return map;
  }

}