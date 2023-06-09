import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final VoidCallback answerQuestion;
  final String answer;

  Answers(this.answerQuestion, this.answer);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: answerQuestion,
          child: Text(
            answer,
            style: TextStyle(fontSize: 15),
          )),
    );
  }
}
