import 'package:first_app/Model/Question.dart';
import 'package:first_app/wquiz.dart';
import 'package:flutter/material.dart';

// void main() {
//   var obj = MyApp();
//   runApp(obj);
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var qIndex = 0;
  var questionnaire = Questionnaire();

  MyAppState() {
    questionnaire.testFill();
  }

  void buttonPressed(int rpta) {
    if (qIndex >= questionnaire.getAllQuestions().length-1) {
      print("No more QUESTIONS! :(");
      return;
    }
    setState(() {
      qIndex++;
    });

    print("Se tocó la Rpta: $rpta");
  }

  void backButtonPressed() {
    if (qIndex <= 0) {
      print("You can't go back for ever, man! Grow up!");
      return;
    }
    setState(() {
      qIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {

    var scaf = Scaffold(
      appBar: AppBar(
        title: Text("Preguntas boludas!"),
        backgroundColor: Color.fromARGB(255, 255, 100, 0),
      ),
      body: WQuiz(questionnaire.getQuestion(qIndex), buttonPressed, backButtonPressed),
    );

    return MaterialApp(
      home: scaf,
    );
  }

  
}
