import 'package:firstproject/quiz_app/model/quiz.dart';
import 'package:firstproject/quiz_app/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/quiz_app/ui/widgets/result.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.resultQuiz, required this.backScreen});
  Quiz resultQuiz;
  VoidCallback backScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'You got ${resultQuiz.getScore()} on ${resultQuiz.question.length}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 600, 
            child: ListView.builder(
              itemCount: resultQuiz.answers.length,
              itemBuilder: (context, index) {
                return Result(
                  index: index + 1,
                  answer: resultQuiz.answers[index],
                );
              },
            ),
          ),

          AppButton("Restart Quiz", onTap: backScreen, icon: Icons.arrow_back),
        ],
      ),
    );
  }
}
