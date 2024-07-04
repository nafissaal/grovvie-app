import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';
import 'package:grovvie/growth_journal/widgets/journal_card.dart';


class SavedJournal extends StatefulWidget {
  const SavedJournal({
    super.key,
    required this.journal,
  });

  final Journals journal;

  @override
  State<SavedJournal> createState() => _SavedJournalState();
}

class _SavedJournalState extends State<SavedJournal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.journal.title!,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Text(
            'Ceritamu',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          JournalCard(journalCardContent: widget.journal.firstStory!),
          const SizedBox(height: 20),
          Text(
            'Pola Fixed Mindset',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          for (var pattern in widget.journal.selectedPatterns!)
            JournalCard(journalCardContent: pattern),
          const SizedBox(height: 20),
          Text(
            'Pemikiran baru',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          JournalCard(journalCardContent: widget.journal.newStory!),
        ],
      ),
    );
  }
}
