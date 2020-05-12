import 'package:first_app/Model/Question.dart';
import 'package:first_app/wquiz.dart';
import 'package:flutter/material.dart';

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
  var userAnswers = List<int>();

  MyAppState() {
    questionnaire.testFill();
  }

  void buttonPressed(int rpta) {
    if (userAnswers.length <= qIndex) {
      userAnswers.add(rpta);
    }
    else {
      userAnswers[qIndex] = rpta;
    }
    
    goQuestionForward();    
    print("Se tocó la Rpta: $rpta");
  }

  void goQuestionForward() {
    if (qIndex >= questionnaire.getAllQuestions().length) {
      print("No more than 'lenght' please!");
      return;
    }
    setState(() {
      qIndex++;
    });
  }

  void goQuestionBackward() {
    if (qIndex < 0) {
      print("Not less than zero, please!!");
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
      body: showBody(),
    );

    return MaterialApp(
      home: scaf,
    );
  }

  Widget showBody() {
    Widget result;

    if (qIndex >= questionnaire.getLength()) {

      var results = questionnaire.checkAllAnswers(this.userAnswers);
      int accerts = 0;
      for (var x in results) if (x == true) accerts++;
      var total = questionnaire.getLength();
      var text = "Accerted $accerts of $total";

      result = Center(
        child: Text(
          "YOU FINISHED!! \n" + text,
          style: TextStyle(fontSize: 35),
        ),
      );
    } else if (qIndex < 0) {
      result = Center(
        child: Text(
          "YOU CAN'T GO BACK FOR EVER! GROW UP, MAN!",
          style: TextStyle(fontSize: 25),
        ),
      );
    } else {
      result = WQuiz(
          questionnaire.getQuestion(qIndex), buttonPressed, goQuestionBackward);
    }
    return result;
  }
}
