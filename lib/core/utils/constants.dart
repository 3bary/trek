import 'package:flutter/material.dart';
import 'package:greendo/features/home/data/models/placeCard_model.dart';

import '../../features/home/data/models/review_model.dart';
import '../../features/user_preferences/data/models/category_model.dart';
import '../../features/user_preferences/data/models/tag_model.dart';

const Color kPrimaryColor = Color(0xffE3F2FD);
const Color kSecondaryColor = Color(0xffA8E6CF);
const Color kTertiaryColor = Color(0xffF5E6CA);
const Color kTextColor = Colors.black87;

//--------------Api---------------
const String kUserId = "user001";
// Endpoints
const String kRecommendationsEndpoint = "recommendations/$kUserId";
String kSearchEndpoint(String query) => "search/$kUserId?query=$query";

abstract class AppConstants {
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
    CategoryModel(name: "Historical", emoji: '🏰', ),
    CategoryModel(name: "Nature", emoji: '🌿', ),
    CategoryModel(name: "Beach", emoji: '🏖',),
    CategoryModel(name: "Food", emoji: '🍽', ),
    CategoryModel(name: "City", emoji: '🌆', ),
    CategoryModel(name: "Adventure", emoji: '⛰',),
    CategoryModel(name: "Wine Tour", emoji: '🍷',),
    CategoryModel(name: "Cultural", emoji: '🏛',),
  ];
  static List<PlaceCardModel> places = [
    PlaceCardModel(
      reviews: [
        ReviewModel(
          name: "John Doe",
          comment: "Amazing place! Totally recommended.",
          isLiked: false,
          isDisliked: false,
          likeCount: 0,
          dislikeCount: 0,
        ),
        ReviewModel(
          name: "Emily",
          comment: "Loved the view!",
          isLiked: false,
          isDisliked: false,
          likeCount: 2,
          dislikeCount: 0,
        ),
      ],
    ),
    PlaceCardModel(
      reviews: [
        ReviewModel(
          name: "Ahlam Gomaa",
          comment: "Great spot for hiking!",
          isLiked: false,
          isDisliked: false,
          likeCount: 1,
          dislikeCount: 0,
        ),
      ],
    ),
    PlaceCardModel(
      reviews: [
        ReviewModel(
          name: "John Doe",
          comment: "Informative and well organized.",
          isLiked: false,
          isDisliked: false,
          likeCount: 3,
          dislikeCount: 0,
        ),
      ],
    ),
    PlaceCardModel(
      reviews: [
        ReviewModel(
          name: "Ahlam Gomaa",
          comment: "Breathtaking views, must visit!",
          isLiked: false,
          isDisliked: false,
          likeCount: 5,
          dislikeCount: 0,
        ),
      ],
    ),
    PlaceCardModel(
      reviews: [
        ReviewModel(
          name: "John Doe",
          comment: "A must-see when in SF.",
          isLiked: false,
          isDisliked: false,
          likeCount: 4,
          dislikeCount: 0,
        ),
      ],
    ),
  ];
}
