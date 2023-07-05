import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class QuestionManager{
  int _question = 0;
  List<Question> _questions = [
  Question('You can lead a cow down stairs but not up stairs', false),
  Question('Approximately one quarter of human bones are in feet', true),
  Question('A slug\'s blood is green', true)
  ];
  int total(){
    return _questions.length;
  }
  void nextquestion(){
    if(_question<_questions.length-1){
      _question++;
    }
  }
  void reset(){
    _question = 0;
  }
  String questiontext(){
    return _questions[_question].que;
  }
  bool answer(){
    return _questions[_question].ans;
  }
}