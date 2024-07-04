import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('d/M/yyyy');

class Journals {
  Journals({
    this.id,
    this.title,
    this.firstStory,
    this.selectedPatterns,
    this.newStory,
    this.date,
  });

  final String? id;
  final String? title;
  final String? firstStory;
  final List<String>? selectedPatterns;
  final String? newStory;
  final DateTime? date;

  String get formattedDate {
    return formatter.format(date!);
  }

  factory Journals.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Journals(
      id: data?['id'],
      title: data?['title'],
      firstStory: data?['firstStory'],
      selectedPatterns: data?['selectedPatterns'] is Iterable
          ? List<String>.from(data?['selectedPatterns'])
          : null,
      newStory: data?['newStory'],
      date: (data?['date'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (firstStory != null) "firstStory": firstStory,
      if (selectedPatterns != null) "selectedPatterns": selectedPatterns,
      if (newStory != null) "newStory": newStory,
      if (date != null) "date": date,
    };
  }
}
