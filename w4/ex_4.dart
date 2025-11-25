import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String text;
  Color color;
  // const CustomCard({super.key});
  CustomCard({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              CustomCard(text: 'OOP', color: Colors.blue[100]!),
              CustomCard(text: 'DART', color: Colors.blue[300]!),
              CustomCard(text: 'FLUTTER', color: Colors.blue[600]!),
            ],
          ),
        ),
      ),
    ),
  );
}
