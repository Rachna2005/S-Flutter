import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Favorite'),
          backgroundColor: Colors.blue,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              FavoritCard(),
              FavoritCard(),
              FavoritCard(),
              FavoritCard(),
              FavoritCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritCard extends StatefulWidget {
  const FavoritCard({super.key});

  @override
  State<FavoritCard> createState() => _FavoritCardState();
}

class _FavoritCardState extends State<FavoritCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.green)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('description'),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
