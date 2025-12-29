import 'package:firstproject/quiz_app/model/quiz.dart';
import 'package:firstproject/quiz_app/ui/screens/question_screen.dart';
import 'package:firstproject/quiz_app/ui/screens/result_screen.dart';
import 'package:firstproject/quiz_app/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

enum AppScreen { welcome, question, result }

class QuizApp extends StatefulWidget {
  QuizApp({super.key, required this.myQuiz});
  Quiz myQuiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  AppScreen currentScreen = AppScreen.welcome;

  void inWelcomeScreen() {
    setState(() {
      currentScreen = AppScreen.question;
    });
  }

  void inQuestionScreen() {
    setState(() {
      currentScreen = AppScreen.result;
    });
  }

  void inResultScreen() {
    setState(() {
      currentScreen = AppScreen.welcome;
    });
  }

  Widget buildScreen() {
    switch (currentScreen) {
      case AppScreen.welcome:
        return WelcomeScreen(onTap: inWelcomeScreen);
      case AppScreen.question:
        return QuestionScreen(
          allQuiz: widget.myQuiz,
          nextScreen: inQuestionScreen,
        );
      case AppScreen.result:
        return ResultScreen(
          resultQuiz: widget.myQuiz,
          backScreen: inResultScreen,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.blue, body: buildScreen()),
    );
  }
}
