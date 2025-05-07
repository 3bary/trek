import 'package:flutter/material.dart';
import '../../features/user_preferences/data/models/category_model.dart';
import '../../features/user_preferences/data/models/tag_model.dart';

const Color kPrimaryColor = Color(0xffE3F2FD);
const Color kSecondaryColor = Color(0xff2e3532);
const Color kTertiaryColor = Color(0xffF5E6CA);
const Color kTextColor = Colors.black87;

abstract class AppConstants {
  static String appName = "TREK";

  static List<TagModel> tags = [
    TagModel(name: "Castles", emoji: '🏰'),
    TagModel(name: "Hiking", emoji: '🥾'),
    TagModel(name: "Architecture", emoji: '🏛️'),
    TagModel(name: "Luxury", emoji: '🏨'),
    TagModel(name: "Wildlife", emoji: '🦅'),
    TagModel(name: "Scenic", emoji: '📸'),
    TagModel(name: "Nightlife", emoji: '🌃'),
    TagModel(name: "Restaurants", emoji: '🍽️'),
    TagModel(name: "Wine", emoji: '🍷'),
    TagModel(name: "Museums", emoji: '🖼️'),
    TagModel(name: "Beaches", emoji: '🏖️'),
    TagModel(name: "Kayaking", emoji: '🚣'),
    TagModel(name: "Cycling", emoji: '🚴'),
    TagModel(name: "Skiing", emoji: '⛷️'),
    TagModel(name: "Photography", emoji: '📷'),
    TagModel(name: "Hot Air Balloon", emoji: '🎈'),
    TagModel(name: "Shopping", emoji: '🛍️'),
    TagModel(name: "Bars", emoji: '🍸'),
    TagModel(name: "Concerts", emoji: '🎶'),
    TagModel(name: "Spa", emoji: '💆'),
    TagModel(name: "UNESCO", emoji: '🏛️'),
  ];

  static List<CategoryModel> categories = [
    CategoryModel(name: "Historical", emoji: '🏰'),
    CategoryModel(name: "Nature", emoji: '🌿'),
    CategoryModel(name: "Beach", emoji: '🏖'),
    CategoryModel(name: "Food", emoji: '🍽'),
    CategoryModel(name: "City", emoji: '🌆'),
    CategoryModel(name: "Adventure", emoji: '⛰'),
    CategoryModel(name: "Wine Tour", emoji: '🍷'),
    CategoryModel(name: "Cultural", emoji: '🏛'),
  ];
}
