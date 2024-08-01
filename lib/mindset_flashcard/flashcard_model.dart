import 'package:cloud_firestore/cloud_firestore.dart';

class FlashcardData {
  FlashcardData({
    this.title,
    this.fixedMindset,
    this.growthMindset,
  });

  final String? title;
  final String? fixedMindset;
  final String? growthMindset;

  factory FlashcardData.fromDocument(DocumentSnapshot doc) {
    return FlashcardData(
      title: doc['title'],
      fixedMindset: doc['fixedMindset'],
      growthMindset: doc['growthMindset'],
    );
  }

  static Future<List<FlashcardData>> fetchFlashcards() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('flashcards').get();

    return snapshot.docs.map((doc) => FlashcardData.fromDocument(doc)).toList();
  }
}