import 'package:cached_network_image/cached_network_image.dart';
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
                ? CachedNetworkImage(
                  imageUrl: imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Image.asset(
                        'assets/images/plane.jpg',
                        fit: BoxFit.cover,
                      ),
                  errorWidget:
                      (context, url, error) => Image.asset(
                        'assets/images/plane.png',
                        fit: BoxFit.cover,
                      ),
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
