import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
//ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //_MyAppState made private so that it cannot be used in other files except this one.
  final _questions = [
    {
      'questionText':
          'How do you feel after spending time with a large group of people?',
      'answers': [
        {'text': 'Energized and refreshed', 'score': 1},
        {'text': 'Neutral, no particular change', 'score': 0},
        {'text': 'Drained, need alone time to recharge', 'score': -1},
      ],
    },
    {
      'questionText': 'In social settings, do you usually:',
      'answers': [
        {'text': 'Initiate conversations and approach others', 'score': 1},
        {'text': 'Engage when approached but don\'t initiate', 'score': 0},
        {'text': 'Wait for others to approach you', 'score': -1},
      ],
    },
    {
      'questionText':
          'How often do you enjoy spending time alone with your thoughts or hobbies?',
      'answers': [
        {
          'text': 'Rarely, I prefer being around people all the time',
          'score': 1
        },
        {
          'text': 'Occasionally, I need a balance of social and alone time',
          'score': 0
        },
        {'text': 'Frequently, I enjoy my own company', 'score': -1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
      print(_totalScore);
      print('Question Index: $_questionIndex');
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Personality Quiz'),
          ),
          body: (_questionIndex < _questions.length)
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
