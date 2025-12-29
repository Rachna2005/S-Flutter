import 'package:firstproject/quiz_app/model/answer.dart';
import 'package:firstproject/quiz_app/model/question.dart';
import 'package:firstproject/quiz_app/model/quiz.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({super.key, required this.allQuiz, required this.nextScreen});
  Quiz allQuiz;
  VoidCallback nextScreen;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;

  void nextQuestion() {
    setState(() {
      if (currentIndex < widget.allQuiz.question.length - 1) {
        currentIndex++;
      } else {
        widget.nextScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.allQuiz.question[currentIndex];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            currentQuestion.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          for (var answer in currentQuestion.choices)
            ElevatedButton(
              onPressed: () {
                widget.allQuiz.addAnswer(
                  Answer(answerChoice: answer, question: currentQuestion),
                );
                nextQuestion();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 100,
                ),
              ),
              child: Text(answer, style: TextStyle(fontSize: 20)),
            ),
        ],
      ),
    );
  }
}
