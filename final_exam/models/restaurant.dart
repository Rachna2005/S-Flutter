
import 'restaurant_comment.dart';

import 'restaurant_type.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List <RestaurantComment> comment ;
 
  Restaurant({required this.name, required this.address, required this.type,required this.comment});

 double rateAverage() {
    if (comment.isEmpty) return 0;

    int total = 0;

    for (final c in comment) {
      total += c.star; 
    }

    return total / comment.length;
  }
}
