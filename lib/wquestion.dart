import 'package:flutter/material.dart';

class WQuestion extends StatelessWidget {
  final String questionText;

  WQuestion(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(62),
        child: Text(
          questionText,
          style: TextStyle(
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
