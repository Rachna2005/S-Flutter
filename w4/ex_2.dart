import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 30),
            ),
          ),
        ),
      ),
    ),
  );
}
