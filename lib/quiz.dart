import 'package:flutter/material.dart';
import './answers.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final int _questionIndex;
  final Function _answerQuestion;
  Quiz(this.questionList, this._questionIndex, this._answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Question(questionList[_questionIndex]["QuestionName"].toString()),
        const SizedBox(
          height: 20,
        ),
        ...(questionList[_questionIndex]["AnswerList"]
                as List<Map<String, Object>>)
            .map((e) {
          return Answers(
              () => _answerQuestion(e["score"]), e['text'].toString());
        }),

        // Image Widget
        Container(
          height: 250,
          width: 250,
          margin: EdgeInsets.all(10),
          child:
              Image.asset("images/hand_fight_black.jpg", fit: BoxFit.contain),
        ),
      ],
    );
  }
}
