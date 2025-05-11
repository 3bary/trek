import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/view_model/add_interactions/add_interactions_cubit.dart';
import '../helpers/cash_helper.dart';
import '../models/place_model.dart';
import '../utils/app_router.dart';

class PlaceCard extends StatefulWidget {
  final PlaceModel place;
  final Set<String> savedPlaceIds;
  final void Function(String placeId)? onRemove;

  const PlaceCard({
    super.key,
    required this.place,
    required this.savedPlaceIds,
    this.onRemove,
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    isFavorite = widget.savedPlaceIds.contains(widget.place.id);
  }

  void toggleFavorite() {
    final user = CashHelper.getCachedUser();
    final placeId = widget.place.id;

    if (user == null || placeId == null || placeId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong. Please try again.")),
      );
      return;
    }

    setState(() {
      if (widget.savedPlaceIds.contains(placeId)) {
        widget.savedPlaceIds.remove(placeId);
        isFavorite = false;
        widget.onRemove?.call(placeId);
      } else {
        widget.savedPlaceIds.add(placeId);
        isFavorite = true;
      }
    });

    context.read<AddInteractionsCubit>().handleInteraction(
      placeId,
      isFavorite ? 'save' : 'save',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 5, right: 5),
      child: Card(
        color: Colors.white,
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
                      widget.place.name!,
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
              Text(
                widget.place.location!.city!,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(widget.place.averageRating!.toString()),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                ],
              ),
              SizedBox(width: 15),
              Text(
                widget.place.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kPlaceDetailsView, extra: widget.place);
                    context.read<AddInteractionsCubit>().handleInteraction(
                      widget.place.id ?? '',
                      'view',
                    );
                  },
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
    );
  }
}
