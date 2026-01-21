import './question.dart';
class Answer{
  final String userAnswer;
  final Question question;

  Answer({required this.question, required this.userAnswer});

  bool isCorrect(){
    return userAnswer == question.correctAnswer;
  }
}