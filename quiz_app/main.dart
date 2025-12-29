import 'package:firstproject/quiz_app/model/quiz.dart';
import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';
import 'ui/screens/welcome_screen.dart';
import 'package:firstproject/quiz_app/data/quiz_mock_repository.dart';

void main() {
 
  // 1 - Load the quiz data
  Quiz quiz = Quiz(
  answers: [],
  question: myQuestion,
);

  // 2 - Display the quiz
  runApp(QuizApp(myQuiz: quiz,));
  // runApp(WelcomeScreen(onTap: sayHello));
}
