import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'OOP',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'DART',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                // color: Colors.blue[600],
                gradient: LinearGradient( colors: [Colors.blue[300]!, Colors.blue[600]!]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
