import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addJournal(Journals journal) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Pengguna belum terautentikasi');

    final docRef = _db.collection('journals').doc();  // Generate a new document reference with an ID
    final newJournal = journal.copyWith(id: docRef.id, userId: user.uid);  // Create a new journal with the generated ID

    await docRef.set(
      newJournal.toFirestore()
    );
  }

  Stream<List<Journals>> getUserJournals(String uid) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Pengguna belum terautentikasi');

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

