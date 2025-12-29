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
        appBar: AppBar(title: Text('Oem Rachna')),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Text('Hello me', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Hello world'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
