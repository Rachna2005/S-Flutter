import './question.dart';
import './answer.dart';
class Quiz {
  final List<Question> questions;
  final List<Answer> answers = [];
  
  Quiz({required this.questions});

  void addAnswer(Answer answer){
    answers.add(answer);
  }

  int getScore(){
    int score = 0 ;
    for(Answer answer in answers){
      if(answer.isCorrect()) score++;
    }
    return score;
  }
}