import 'package:flutter/material.dart';
class MyGradianButton extends StatelessWidget {
  // const MyGradianButton({super.key});
  String text;
  Color color1;
  Color color2;
MyGradianButton({required this.text, required this.color1, required this.color2});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
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
              MyGradianButton(text: 'HELLO1', color1: Colors.blue, color2: Colors.red),
              MyGradianButton(text: 'HELLO2', color1: Colors.blue, color2: Colors.red),
              MyGradianButton(text: 'HELLO3', color1: Colors.blue, color2: Colors.red),
            ],
          ),
        ),
      ),
    ),
  );
}