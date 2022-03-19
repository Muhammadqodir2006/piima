// ignore_for_file: prefer_initializing_formals, file_names, non_constant_identifier_names

class Quest {
  late final String text;
  late final List<String> vars;
  bool rasmBor = false;
  String rasmLoc = '';
  late final String correctAnswer;

  Quest(String q_text, List<String> q_vars, String q_correctAnswer) {
    text = q_text;
    vars = q_vars;
    correctAnswer = q_correctAnswer;
  }
  Quest.r(String q_text, List<String> q_vars, String q_correctAnswer,
      bool q_rasmBor, String q_rasmLoc) {
    correctAnswer = q_correctAnswer;
    text = q_text;
    vars = q_vars;
    rasmBor = q_rasmBor;
    rasmLoc = q_rasmLoc;
  }
}
