import 'question.dart';
class Answer{
  final String answerChoice;
  Question question;
  Answer({required this.answerChoice, required this.question});
  bool isGood(){
    return answerChoice == question.goodChoice;
  }
}