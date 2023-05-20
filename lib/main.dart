import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _score = 0;

  final questionList = [
    {
      "QuestionName": 'Who is the founder of the flutter ?',
      "AnswerList": [
        {"text": "Facebook", "score": 0},
        {"text": "Google", "score": 5},
        {"text": "Youtube", "score": 0},
        {"text": "Instagram", "score": 0}
      ]
    },
    {
      "QuestionName": "Who owns iphone ?",
      "AnswerList": [
        {'text': 'Oppo', 'score': 0},
        {'text': 'Microsoft', 'score': 0},
        {'text': 'Apple', 'score': 5},
        {'text': 'Samsung', 'score': 0},
      ]
    },
    {
      "QuestionName": "Who is the founder of facebook ?",
      "AnswerList": [
        {'text': 'Mark Zuckerberg', 'score': 5},
        {'text': 'Sundar Pichai', 'score': 0},
        {'text': 'Elon Musk', 'score': 0},
        {'text': 'Larry Page', 'score': 0},
      ]
    },
  ];
  void resetData() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(int score) {
    _score = _score + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Quizz App'),
          ),
          body: _questionIndex < questionList.length
              ? Quiz(questionList, _questionIndex, _answerQuestion)
              : Result(_score, resetData),
        ));
  }
}
