import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final VoidCallback onPress;
  const AnswerButton({
    required this.answer,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(20),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(answer, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
        ),
      ),
    );
  }
}



