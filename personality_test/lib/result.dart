import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    var resultText;
    if (totalScore >= -3 && totalScore <= -1) {
      resultText = 'You tend to be introverted.';
    } else if (totalScore == 0) {
      resultText = 'You are an ambivert';
    } else if (totalScore >= 1 && totalScore <= 3) {
      resultText = 'You tend to be extroverted.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        TextButton(onPressed: resetQuiz, child: Text('RESET')),
      ],
    ));
  }
}
