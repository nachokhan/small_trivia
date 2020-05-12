import 'package:flutter/material.dart';

class WResult extends StatelessWidget {
  final String text;
  final Function onResetPressed;

  WResult(this.text, this.onResetPressed);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "YOU FINISHED!! \n" + text,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              "Restart Quiz!",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: onResetPressed,
          ),
        ],
      ),
    );
  }
}
