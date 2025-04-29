import 'package:flutter/material.dart';
import '../../../../../core/models/place_model.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.imageUrl,
    required this.place,
    this.imageHeight = 250,
  });

  final String? imageUrl;
  final double imageHeight;
  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    double finalHeight =
        imageHeight.isFinite && imageHeight > 0 ? imageHeight : 250.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child:
          place.imageUrl != null && place.imageUrl!.isNotEmpty
              ? FadeInImage.assetNetwork(
                placeholder: 'assets/images/plane.jpg',
                image: place.imageUrl!,
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
