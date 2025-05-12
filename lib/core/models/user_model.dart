import '../../features/user_preferences/data/models/user_prefs_model.dart';

class UserModel {
  UserModel({
      this.preferences, 
      this.id, 
      this.name, 
      this.role, 
      this.savedPlaces,});

  UserModel.fromJson(dynamic json) {
    preferences = json['preferences'] != null ? UserPrefsModel.fromJson(json['preferences']) : null;
    id = json['_id'];
    name = json['name'];
    role = json['role'];
    savedPlaces = json['saved_places'] != null ? json['saved_places'].cast<String>() : [];
  }
  UserPrefsModel? preferences;
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
