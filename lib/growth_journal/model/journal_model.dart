import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class Journal {
  Journal({
    required this.id,
    required this.title,
    required this.firstStory,
    required this.selectedPatterns,
    required this.newStory,
    required this.date,
  });

  final String id;
  final String title;
  final String firstStory;
  final List<String> selectedPatterns;
  final String newStory;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
