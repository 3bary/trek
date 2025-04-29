class UserModel {
  UserModel({
      this.preferences, 
      this.id, 
      this.name, 
      this.email, 
      this.passwordHash, 
      this.role, 
      this.savedPlaces, 
      this.searchHistory, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  UserModel.fromJson(dynamic json) {
    preferences = json['preferences'] != null ? Preferences.fromJson(json['preferences']) : null;
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    role = json['role'];
    savedPlaces = json['saved_places'] != null ? json['saved_places'].cast<String>() : [];
    if (json['search_history'] != null) {
      searchHistory = [];
      json['search_history'].forEach((v) {
        searchHistory?.add(SearchHistory.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
  }
  Preferences? preferences;
  String? id;
  String? name;
  String? email;
  String? passwordHash;
  String? role;
  List<String>? savedPlaces;
  List<SearchHistory>? searchHistory;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (preferences != null) {
      map['preferences'] = preferences?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['passwordHash'] = passwordHash;
    map['role'] = role;
    map['saved_places'] = savedPlaces;
    if (searchHistory != null) {
      map['search_history'] = searchHistory?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

class SearchHistory {
  SearchHistory({
      this.query, 
      this.keywords, 
      this.timestamp,});

  SearchHistory.fromJson(dynamic json) {
    query = json['query'];
    keywords = json['keywords'] != null ? json['keywords'].cast<String>() : [];
    timestamp = json['timestamp'];
  }
  String? query;
  List<String>? keywords;
  String? timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['query'] = query;
    map['keywords'] = keywords;
    map['timestamp'] = timestamp;
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