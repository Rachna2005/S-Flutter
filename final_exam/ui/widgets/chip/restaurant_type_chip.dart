// Widget to disaply a restaurant type chip

import 'package:flutter/material.dart';
import '../../../models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  RestaurantType type;
  RestaurantTypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(type.name), backgroundColor: type.color);
  }
}
