class UpdateTravelPreferencesRequestBody {
  UpdateTravelPreferencesRequestBody({
    this.destinations,
    this.travelDates,
    this.groupType,
    this.accessibilityNeeds,
    this.budget,
  });

  UpdateTravelPreferencesRequestBody.fromJson(dynamic json) {
    destinations =
        json['destinations'] != null ? json['destinations'].cast<String>() : [];
    travelDates = json['travel_dates'];
    groupType = json['group_type'];
    accessibilityNeeds =
        json['accessibility_needs'] != null
            ? json['accessibility_needs'].cast<String>()
            : [];
    budget = json['budget'];
  }
  List<String>? destinations;
  String? travelDates;
  String? groupType;
  List<String>? accessibilityNeeds;
  String? budget;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['destinations'] = destinations;
    map['travel_dates'] = travelDates;
    map['group_type'] = groupType;
    map['accessibility_needs'] = accessibilityNeeds;
    map['budget'] = budget;
    return map;
  }
}
