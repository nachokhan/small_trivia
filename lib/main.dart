import 'package:first_app/Model/Question.dart';
import 'package:first_app/wanswer.dart';
import 'package:first_app/wquestion.dart';
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

  void botonPressed(int rpta) {
    if (qIndex >= questionnaire.getAllQuestions().length-1) {
      print("No more QUESTIONS! :(");
      return;
    }
    setState(() {
      qIndex++;
    });

    print("Se tocó la Rpta: $rpta");
  }

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: <Widget>[
        WQuestion(questionnaire.getQuestionText(qIndex)),
        ...createWAnswersList(questionnaire.getQuestion(qIndex)),
      ],
    );

    var scaf = Scaffold(
      appBar: AppBar(
        title: Text("Preguntas boludas!"),
        backgroundColor: Color.fromARGB(255, 255, 100, 0),
      ),
      body: column,
    );

    return MaterialApp(
      home: scaf,
    );
  }

  List<WAnswer> createWAnswersList(Question question) {
    var answers = question.answers;
    var wans = List<WAnswer>();
    for (int i = 0; i < answers.length; i++) {
      var an = WAnswer(answers[i], i + 1, botonPressed);
      wans.add(an);
    }
    return wans;
  }
}
