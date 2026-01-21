import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../../models/restaurant_type.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool onlyKhmer = false;

  @override
  Widget build(BuildContext context) {
    final filteredRestaurants = onlyKhmer
        ? widget.restaurants
              .where((r) => r.type == RestaurantType.khmer)
              .toList()
        : widget.restaurants;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Show only Khmer restaurants'),
              value: onlyKhmer,
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  onlyKhmer = value;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      CardRestaurant(restaurant: filteredRestaurants[index]);
                    },
                  );
                  // return CardRestaurant(restaurant: filteredRestaurants[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                RestaurantStarChip(star: restaurant),
                SizedBox(width: 8),

                RestaurantTypeChip(type: restaurant.type),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
