import 'package:flutter/material.dart';
import 'package:grovvie/quiz/quiz_model.dart';
import 'package:grovvie/quiz/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.questions,
    required this.onSelectAnswer,
  });

  final List<QuizQuestion> questions;
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
