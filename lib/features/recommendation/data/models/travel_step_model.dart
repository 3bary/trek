import 'package:greendo/core/models/place_model.dart';

class TravelStepModel {
  TravelStepModel({
      this.place, 
      this.nextDestination,});

  TravelStepModel.fromJson(dynamic json) {
    place = json['place'] != null ? PlaceModel.fromJson(json['place']) : null;
    nextDestination = json['next_destination'];
  }
  PlaceModel? place;
  String? nextDestination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (place != null) {
      map['place'] = place?.toJson();
    }
    map['next_destination'] = nextDestination;
    return map;
  }

}