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
    this.userId,
  });

  final String? id;
  final String? title;
  final String? firstStory;
  final List<String>? selectedPatterns;
  final String? newStory;
  final DateTime? date;
  final String? userId;

  String get formattedDate {
    return formatter.format(date!);
  }

  Journals copyWith({
    String? id,
    String? title,
    String? firstStory,
    List<String>? selectedPatterns,
    String? newStory,
    DateTime? date,
    String? userId,
  }) {
    return Journals(
      id: id ?? this.id,
      title: title ?? this.title,
      firstStory: firstStory ?? this.firstStory,
      selectedPatterns: selectedPatterns ?? this.selectedPatterns,
      newStory: newStory ?? this.newStory,
      date: date ?? this.date,
      userId: userId ?? this.userId,
    );
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
      userId: data?['userId'],
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
      if (userId != null) "userId": userId,
    };
  }
}
