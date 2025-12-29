
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
        appBar: AppBar(title: Text('My Profile')),
        body: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.red],
            ),
          ),
          child: Column(
            children: [
              Text(
                'Oem Rachna',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Flutter learner')
            ],
          ),
        ),
      ),
    );
  }
}
