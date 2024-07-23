import 'package:cloud_firestore/cloud_firestore.dart';

class Quizzes {
  Quizzes({
    required this.quizId,
    required this.questions,
  });

  final String quizId;
  final List<QuizQuestion> questions;
}

class QuizQuestion {
  QuizQuestion({
    required this.text,
    required this.answers,
  });

  final String text; 
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

Future<Quizzes> fetchQuiz(String quizId) async {
  // Fetch the quiz document
  final quizDoc = await FirebaseFirestore.instance.collection('quizzes').doc(quizId).get();
  
  // Fetch the questions collection
  final questionsQuerySnapshot = await FirebaseFirestore.instance
      .collection('quizzes')
      .doc(quizId)
      .collection('questions')
      .get();

  // Map the questions to a List of QuizQuestion
  List<QuizQuestion> questions = questionsQuerySnapshot.docs.map((doc) {
    return QuizQuestion(
      text: doc['text'] as String,
      answers: List<String>.from(doc['answers']),
    );
  }).toList();

  // Create and return a Quizzes object
  return Quizzes(
    quizId: quizDoc.id,
    questions: questions,
  );
}
