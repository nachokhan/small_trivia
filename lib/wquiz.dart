import 'package:flutter/material.dart';

import 'Model/Question.dart';
import 'wquestion.dart';
import 'wanswer.dart';

class WQuiz extends StatelessWidget {
  final Question question;
  final Function(int) buttonPressed;
  final Function backPressed;

  WQuiz(this.question, this.buttonPressed, this.backPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WQuestion(question.question),
        ...createWAnswersList(question),
        RaisedButton(          
          color: Colors.blue,
          child: Text(
            "<- Back",
            style: TextStyle(fontSize: 22),
          ),
          onPressed: backPressed,
        )
      ],
    );
  }

  /// Based on a Question, takes its answers and builds
  /// a list of Answer Widgets (WAnswer) to be returned
  /// as a list.
  List<WAnswer> createWAnswersList(Question question) {
    var answers = question.answers;
    var wans = List<WAnswer>();
    for (int i = 0; i < answers.length; i++) {
      var an = WAnswer(answers[i], i + 1, () => buttonPressed(i+1));
      wans.add(an);
    }
    return wans;
  }
}
