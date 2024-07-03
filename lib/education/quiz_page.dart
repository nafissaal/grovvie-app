import 'package:flutter/material.dart';
import 'package:grovvie/education/model/course_data.dart';

import 'questions_screen.dart';
import 'results_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.quiz,
    required this.quizId,
  });

  final Quiz quiz;
  final String quizId;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'questions-screen';

  // void _switchScreen() {
  //   setState(() {
  //     _activeScreen = 'questions-screen';
  //   });
  // }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == widget.quiz.questions.length) {
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
  Widget build(context) {
    // Widget screenWidget = QuizStart(_switchScreen);
    Widget screenWidget = QuestionsScreen(onSelectAnswer: _chooseAnswer,
        questions: widget.quiz.questions,);

    // if (_activeScreen == 'questions-screen') {
    //   screenWidget = QuestionsScreen(
    //     onSelectAnswer: _chooseAnswer,
    //     questions: widget.quiz.questions,
    //   );
    // }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
        // is questions necessary?
        questions: widget.quiz.questions,
      );
    }

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
          child: Expanded(child: screenWidget),
        ),
      ),
    );
  }
}
