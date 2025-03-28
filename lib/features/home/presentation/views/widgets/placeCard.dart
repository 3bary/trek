import 'package:flutter/material.dart';

class PlaceCard extends StatefulWidget {
  final String title;
  final String city;
  final double rating;
  final String shortDescription;
  final VoidCallback onDetailsPressed;

  const PlaceCard({
    super.key,
    required this.title,
    required this.city,
    required this.rating,
    required this.shortDescription,
    required this.onDetailsPressed,
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
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> places = [];
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
              SizedBox(height: 10),
              Text(
                widget.shortDescription,
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
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
