import 'package:flutter/material.dart';
import '../../../data/models/place_model.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.placeUrl,
    required this.placeCardModel,
    this.imageHeight = 250,
  });

  final String? placeUrl;
  final double imageHeight;
  final PlaceModel placeCardModel;

  @override
  Widget build(BuildContext context) {
    double finalHeight =
        imageHeight.isFinite && imageHeight > 0 ? imageHeight : 250.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child:
          placeCardModel.imageUre != null && placeCardModel.imageUre!.isNotEmpty
              ? FadeInImage.assetNetwork(
                placeholder: 'assets/images/plane.jpg',
                image: placeCardModel.imageUre!,
                width: double.infinity,
                height: finalHeight,
                fit: BoxFit.cover,
              )
              : Image.asset(
                'assets/images/plane.png',
                width: double.infinity,
                height: finalHeight,
                fit: BoxFit.cover,
              ),
    );
  }
}
