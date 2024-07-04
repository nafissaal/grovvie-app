import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addJournal(Journals journal) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('No authenticated user');

    final docRef = _db.collection('journals').doc();  // Generate a new document reference with an ID
    final newJournal = journal.copyWith(id: docRef.id);  // Create a new journal with the generated ID

    await docRef.set({
      'id': newJournal.id,
      'title': newJournal.title,
      'firstStory': newJournal.firstStory,
      'selectedPatterns': newJournal.selectedPatterns,
      'newStory': newJournal.newStory,
      'date': newJournal.date,
      'userId': user.uid,
    });
  }
  
  Stream<List<Journals>> getUserJournals() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('No authenticated user');

    return _db
        .collection('journals')
        .where('userId', isEqualTo: user.uid)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Journals.fromFirestore(doc, null))
            .toList());
  }

  Future<void> deleteJournal(String id) async {
    await _db.collection('journals').doc(id).delete();
  }
}

extension JournalsCopyWith on Journals {
  Journals copyWith({
    String? id,
    String? title,
    String? firstStory,
    List<String>? selectedPatterns,
    String? newStory,
    DateTime? date,
  }) {
    return Journals(
      id: id ?? this.id,
      title: title ?? this.title,
      firstStory: firstStory ?? this.firstStory,
      selectedPatterns: selectedPatterns ?? this.selectedPatterns,
      newStory: newStory ?? this.newStory,
      date: date ?? this.date,
    );
  }
}