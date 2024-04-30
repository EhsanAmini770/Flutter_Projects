import 'package:quiz/questions.dart';

class QuizBrain {
  List<Questions> _questions = [
    Questions(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        answerKey: false),
    Questions(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        answerKey: true),
    Questions(questionText: 'A slug\'s blood is green.', answerKey: true),
    Questions(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        answerKey: true),
    Questions(
        questionText: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answerKey: true),
    Questions(
        questionText: 'It is illegal to pee in the Ocean in Portugal.',
        answerKey: true),
    Questions(
        questionText:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answerKey: false),
    Questions(
        questionText:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answerKey: true),
    Questions(
        questionText:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answerKey: false),
    Questions(
        questionText:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answerKey: true),
    Questions(
        questionText: 'Google was originally called \"Backrub\".',
        answerKey: true),
    Questions(
        questionText:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answerKey: true),
    Questions(
        questionText:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answerKey: true),
  ];
  int _questionTracer = 0;
  String getQuestion() {
    return _questions[_questionTracer].questionText;
  }

  bool getAnswerKey() {
    return _questions[_questionTracer].answerKey;
  }

  void nextQuestion() {
    if (_questionTracer < _questions.length - 1) {
      _questionTracer++;
    }
  }
}
