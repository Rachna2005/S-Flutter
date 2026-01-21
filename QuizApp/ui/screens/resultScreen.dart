import 'package:flutter/material.dart';
import '../widgets/resultQuestion.dart';
import '../widgets/button.dart';
import '../../models/quiz.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onPressRestart;
  final Quiz quiz;
  const ResultScreen({
    required this.onPressRestart,
    required this.quiz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
            child: Text("You answered ${quiz.getScore()} on ${quiz.questions.length} !!!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: quiz.answers.length,
              itemBuilder: (context, index) {
                return ResultQuestion(
                  number: index+1, 
                  answer: quiz.answers[index]
                );
              }
            )
          ),
          SizedBox(height: 20),
          QuizButton(onPress: onPressRestart, name: "Restart")
        ],
      ),
    );
  }
}


