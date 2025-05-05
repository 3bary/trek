import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/view_model/save_places/save_places_cubit.dart';

class PlaceCard extends StatefulWidget {
  final String title;
  final String? imageUrl;
  final String city;
  final double rating;
  final String description;
  final int likes;
  final VoidCallback onDetailsPressed;
  final String placeId;

  const PlaceCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.city,
    required this.rating,
    required this.description,
    required this.onDetailsPressed,
    required this.likes,
    required this.placeId,
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    print('placeId sent to savePlace: ${widget.placeId}');
    context.read<SavePlaceCubit>().savePlace(widget.placeId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavePlaceCubit, SavePlaceState>(
      listener: (context, state) {
        if (state is SavePlaceFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("❌ ${state.error}")));
          setState(() {
            isFavorite = !isFavorite;
          });
        } else if (state is SavePlaceSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("✅ ${state.message}")));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4, left: 5, right: 5),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: toggleFavorite,
                    ),
                  ],
                ),
                Text(widget.city, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(widget.rating.toString()),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.amber, size: 18),
                  ],
                ),
                SizedBox(width: 15),

                Text(
                  widget.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: widget.onDetailsPressed,
                    child: Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
