class QuizQuestion{
  const QuizQuestion(this.questions, this.answers);

  final String questions;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final List<String> shuffledAnswers = List.from(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}