import 'package:flutter/material.dart';
import 'package:grovvie/quiz/quiz_model.dart';

import 'questions_screen.dart';
import 'results_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.quizId,
  });

  final String quizId;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Future<Quizzes> _quiz;
  Quizzes? _loadedQuiz;

  @override
  void initState() {
    super.initState();
    _quiz = fetchQuiz(widget.quizId);
    _quiz.then((quiz) {
      setState(() {
        _loadedQuiz = quiz;
      });
    });
  }

  List<String> _selectedAnswers = [];
  var _activeScreen = 'questions-screen';

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_loadedQuiz != null &&
        _selectedAnswers.length == _loadedQuiz!.questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
              Theme.of(context).colorScheme.tertiaryContainer,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FutureBuilder<Quizzes>(
            future: _quiz,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final quiz = snapshot.data!;
                 _loadedQuiz = quiz;
                Widget screenWidget = QuestionsScreen(
                  onSelectAnswer: _chooseAnswer,
                  questions: quiz.questions,
                );

                if (_activeScreen == 'results-screen') {
                  screenWidget = ResultsScreen(
                    chosenAnswers: _selectedAnswers,
                    onRestart: restartQuiz,
                    questions: quiz.questions,
                  );
                }

                return screenWidget;
              } else {
                return const Text('Data tidak ditemukan');
              }
            },
          ),
        ),
      ),
    );
  }
}
