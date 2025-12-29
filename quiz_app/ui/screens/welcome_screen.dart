import 'package:firstproject/quiz_app/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, re, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 450, height: 450),
          AppButton('Start Quiz', onTap: onTap, icon: Icons.start),
        ],
      ),
    );
  }
}
