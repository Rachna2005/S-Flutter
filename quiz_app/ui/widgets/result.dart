import 'package:firstproject/quiz_app/model/answer.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({super.key, required this.index, required this.answer});
  int index;
  Answer answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: answer.isGood() ? Colors.green : Colors.red,
              child: Text(
                index.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 30),
            Text(
              answer.question.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...answer.question.choices.map((ans) {
              bool isCorrect = ans == answer.question.goodChoice;
              return Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 24,
                        padding: EdgeInsets.only(top: 2),
                        child: isCorrect
                            ? Icon(Icons.check, size: 18, color: Colors.black)
                            : null,
                      ),
                      SizedBox(width: 8),
                      Text(
                        ans,
                        style: TextStyle(
                          fontSize: 15,
                          color: answer.answerChoice == ans
                              ? (isCorrect ? Colors.green : Colors.red)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
