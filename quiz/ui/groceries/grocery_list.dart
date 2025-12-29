import 'package:flutter/material.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';
import 'grocery_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  int _currentIndex = 0;
  void onCreate() async {
    // Navigate to the form screen using the Navigator push
    Grocery? newGrocery = await Navigator.push<Grocery>(
      context,
      MaterialPageRoute(builder: (context) => const GroceryForm()),
    );
    if (newGrocery != null) {
      setState(() {
        dummyGroceryItems.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Widget content = const Center(child: Text('No items added yet.'));

    // if (dummyGroceryItems.isNotEmpty) {
    //   //  Display groceries with an Item builder and  LIst Tile
    //   content = ListView.builder(
    //     itemCount: dummyGroceryItems.length,
    //     itemBuilder: (context, index) =>
    //         GroceryTile(grocery: dummyGroceryItems[index]),
    //   );
    // }
    final pages = [AllGrocery(), SearchGrocery()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      // body: content,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Grocery',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}

class SearchGrocery extends StatefulWidget {
  const SearchGrocery({super.key});

  @override
  State<SearchGrocery> createState() => _SearchGroceryState();
}

class _SearchGroceryState extends State<SearchGrocery> {
  String input = '';

  @override
  Widget build(BuildContext context) {
    final filter = dummyGroceryItems.where((item) {
      return item.name.toUpperCase().contains(input.toUpperCase());
    }).toList();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(label: Text('Search Grocery')),
            onChanged: (value) {
              setState(() {
                input = value;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filter.length,
            itemBuilder: (context, index) =>
                GroceryTile(grocery: filter[index]),
          ),
        ),
      ],
    );
  }
}

class AllGrocery extends StatelessWidget {
  const AllGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyGroceryItems.length,
      itemBuilder: (context, index) =>
          GroceryTile(grocery: dummyGroceryItems[index]),
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 15, height: 15, color: grocery.category.color),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
