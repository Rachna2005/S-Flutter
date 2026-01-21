// Widget to disaply a restaurant stars chip
import 'package:flutter/material.dart';
import '../../../models/restaurant.dart';

class RestaurantStarChip extends StatelessWidget {
  final Restaurant star;

  const RestaurantStarChip({
    super.key,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.star),
      label: Text(
        star.rateAverage().toStringAsFixed(1), 
      ),
    );
  }
}

