import 'package:flutter/material.dart';
import 'package:greendo/features/home/presentation/views/widgets/place_image.dart';

import '../place_details_view.dart';

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({
    super.key,
    required this.title,
    required this.top,
    required this.widget,
  });

  final String title;
  final double top;
  final PlaceDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        textAlign: TextAlign.start,
        title,
        style: TextStyle(
          fontSize: top > 100 ? 16 : 18,
          color: Colors.white,
          shadows: const [
            Shadow(blurRadius: 2, color: Colors.black54, offset: Offset(0, 1)),
          ],
        ),
      ),
      background: Hero(
        tag: widget.place.id ?? widget.place.name ?? 'defaultTag',
        child: PlaceImage(imageUrl: widget.place.imageUrl ?? ''),
      ),
      collapseMode: CollapseMode.parallax,
    );
  }
}
