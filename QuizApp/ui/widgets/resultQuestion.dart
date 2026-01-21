import 'package:flutter/material.dart';
import '../../models/answer.dart';

class ResultQuestion extends StatelessWidget {
  final int number;
  final Answer answer;
  const ResultQuestion({
    required this.answer,
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: answer.isCorrect() ? Colors.green : Colors.red,
              child: Text(number.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(answer.question.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 10),
                  ...answer.question.answerChoices.map((ans) {
                    bool isCorrect = ans == answer.question.correctAnswer;
                    return  Row(
                      children: [
                        isCorrect ? Icon(Icons.check, size: 20) : SizedBox(width: 20) ,
                        SizedBox(width: 10),
                        Text(ans, 
                          style: TextStyle(
                            fontSize: 15, 
                            color: isCorrect ? Colors.green: (answer.userAnswer == ans ? Colors.red: Colors.black), 
                            fontWeight: (isCorrect || answer.userAnswer == ans) ? FontWeight.bold : FontWeight.normal
                          )
                        ),
                      ],
                    );
                }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



