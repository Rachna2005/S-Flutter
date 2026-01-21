// YOUR CODE
import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import 'restaurant_comments_form.dart';
import '../../models/restaurant_comment.dart';
import '../widgets/chip/stars_chip.dart';

class RestaurantDetailView extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailView({super.key, required this.restaurant });

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {
  void onComment() async {
    RestaurantComment? newComment = await Navigator.push<RestaurantComment>(
      context,
      MaterialPageRoute(builder: (context) => const CommentsForm()),
    );
      setState(() {
        widget.restaurant.comment.add(newComment!);
      });

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.main,
        onPressed: onComment,

        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
            color: AppColors.main,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),

                const SizedBox(height: 8),

                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  widget.restaurant.address,
                  style: const TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 12),
                Row(
                  children: [
                    RestaurantTypeChip(type: widget.restaurant.type),

                    const SizedBox(width: 8),

                    RestaurantStarChip(star: widget.restaurant),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: widget.restaurant.comment!.length,
              itemBuilder: (context, index) {
                final comment = widget.restaurant.comment![index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(Icons.comment),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            comment.feedback,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),

                        Text(
                          comment.star.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
