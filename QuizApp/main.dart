import 'package:flutter/material.dart';
import './ui/screens/startScreen.dart';
import './ui/screens/questionScreen.dart';
import './ui/screens/resultScreen.dart';
import './data/storages/quiz.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: QuizApp()
      )
    ),
  );
}


class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int screenIndex = 0;
  void changeScreen([bool isRestart = false]){
    if(isRestart){
      quiz.answers.clear();
    }
    setState(() {
      screenIndex = screenIndex == 2 ? 0 : screenIndex+1;
    });
  }

  Widget currentScreen() {
    switch(screenIndex) {
      case 0:
        return StartScreen(onPressStart: ()=> changeScreen());
      case 1:
        return QuestionScreen(quiz: quiz, onPressLastQuestion: () => changeScreen());
      case 2:
        return ResultScreen(quiz: quiz, onPressRestart: () => changeScreen(true));
      default:
        return Container(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return currentScreen();
  }
}

