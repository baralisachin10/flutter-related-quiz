class QuizQuestion {
  const QuizQuestion(this.questions, this.answers);
  final String questions;
  final List<String> answers;

  List<String> get shuffledAnswer{
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
