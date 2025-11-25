
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: 'Travelling', icon: Icons.luggage),
              HobbyCard(title: 'Home', icon: Icons.home, color: Colors.pink),
              HobbyCard(
                title: 'School',
                icon: Icons.school,
                color: Colors.purpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  String title;
  IconData icon;
  Color color;
  HobbyCard({
    required this.title,
    required this.icon,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(top: 40, bottom: 40)),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 30),
              child: Icon(
                icon,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 253, 253),
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
