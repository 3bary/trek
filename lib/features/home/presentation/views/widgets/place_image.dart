import 'package:flutter/material.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child:
            imageUrl != null && imageUrl!.isNotEmpty
                ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/plane.jpg',
                  image: imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                : Image.asset(
                  'assets/images/plane.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
      ),
    );
  }
}
