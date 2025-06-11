class WarningModel {
  WarningModel({
      this.warningType, 
      this.message,});

  WarningModel.fromJson(dynamic json) {
    warningType = json['warning_type'];
    message = json['message'];
  }
  String? warningType;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['warning_type'] = warningType;
    map['message'] = message;
    return map;
  }

}