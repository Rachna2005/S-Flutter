 
import 'answer.dart';
import 'question.dart';

class Quiz {

  List<Question> question;
  List<Answer> answers = [];
  Quiz({required this.question, required this.answers});
  
  void addAnswer (Answer answer){
    answers.add(answer);
  }

  int getScore(){
    int score = 0;
    for(Answer answer in answers){
      if(answer.isGood()) score++;
    }
    return score;
  }

}






