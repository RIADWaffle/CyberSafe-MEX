


class SessionQuestions {
  final int idSession;
  final int finished;


  SessionQuestions({
    required this.idSession,
    required this.finished,

  });

  Map<String, dynamic> toMap() {
    return {
      'idSession': idSession,
      'finished': finished,
    };
  }
}

class Question {
  final int sessionId;
  final String question;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.sessionId,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }
}


