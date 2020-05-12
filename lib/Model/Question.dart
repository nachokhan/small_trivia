/// ************************************************
///  Question holds a question and its answers.
///  Also the correct answer is part of it...
/// ************************************************
///
class Question {
  String question;
  List<String> answers;
  int correctAnswer;

  Question(String question, List<String> answers, int correctAnswer) {
    if (answers.length < correctAnswer) {
      throw Exception("correctAnswer is bigger than lenght of answers");
    }

    this.question = question;
    this.answers = answers;
    this.correctAnswer = correctAnswer;
  }
}

/// ************************************************
///  Questionnaire holds a list of Questions.
///  Can eventually check if given answers ar ok.
/// ************************************************

class Questionnaire {
  List<Question> questions;

  Questionnaire() {
    questions = List<Question>();
  }

  void addQuestion(String q, List<String> a, int cA) {
    questions.add(Question(q, a, cA));
  }

  Question getQuestion(int index) {
    if (index >= questions.length) {
      throw Exception("Index exceds questions!");
    }
    return questions[index];
  }

  String getQuestionText(int index) {
    if (index >= questions.length) {
      throw Exception("Index exceds questions!");
    }

    return questions[index].question;
  }

  List<String> getAnswersText(int index) {
    if (index >= questions.length) {
      throw Exception("Index exceds questions!");
    }

    return questions[index].answers;
  }

  int getCorrectAnswer(int index) {
    if (index >= questions.length) {
      throw Exception("Index exceds questions!");
    }

    return questions[index].correctAnswer;
  }

  bool checkParticularAnswer(int index, int answer) {
    if (index >= questions.length) {
      throw Exception("Index exceds questions!");
    }
    bool result = false;

    if (answer == questions[index].correctAnswer) {
      result = true;
    }
    return result;
  }

  List<bool> checkAllAnswers(List<int> userAnswers) {
    if (userAnswers.length != questions.length) {
      throw Exception("Answers and Questions's lenght don't match.");
    }

    var result = List<bool>();

    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) {
        result.add(true);
      } else {
        result.add(false);
      }
    }

    return result;
  }

  List<Question> getAllQuestions() {
    return this.questions;
  }

  void testFill() {
    this.addQuestion("Quién creo esta App?",
        ["El Papa", "El Nacho", "Alí Baba", "Trolebús"], 2);
    this.addQuestion("Cuantos años tiene M. Legrand?",
        ["Menos de 40", "Entre 40 y 70", "Mas de 90"], 3);
    this.addQuestion("Con qué se hizo esta App",
        ["Kotlin", "Flutter", "Unity", "ASM", "C/C++", "Invio"], 2);
    this.addQuestion("Cuántas hormigas pueden vivir en un hormiguero?",
        ["De 1 a 6", "De 50 a 100", "De 1 a 5000", "Ni la más puta idea"], 3);
  }
}
