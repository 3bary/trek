class UserPrefsModel {
  UserPrefsModel({
      this.categories, 
      this.tags,});

  UserPrefsModel.fromJson(dynamic json) {
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