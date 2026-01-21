import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  final String name;
  final VoidCallback onPress;
  const QuizButton({
    required this.onPress,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 5,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      onPressed: onPress,
      child: Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
    );
  }
}