import 'package:flutter/material.dart';

class WAnswer extends StatelessWidget {
  final String answerText;
  final Function(int) onPressFunc;
  final int whichAnswerAmI;

  WAnswer(this.answerText, this.whichAnswerAmI, this.onPressFunc);

  callBackFunc() {
    onPressFunc(whichAnswerAmI);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.deepOrangeAccent,
        child: Text(answerText, style: TextStyle(fontSize: 20)),
        onPressed: callBackFunc,
      ),
    );
  }
}
