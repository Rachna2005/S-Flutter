import 'package:flutter/material.dart';
import '../widgets/button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onPressStart;
  const StartScreen({
    required this.onPressStart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: QuizButton(name: 'Start quiz', onPress: onPressStart,)
      )
    );
  }
}