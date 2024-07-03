import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';
import 'package:grovvie/growth_journal/saved_journal.dart';
import 'package:grovvie/growth_journal/widgets/journal_item.dart';



class JournalListTile extends StatefulWidget {
  const JournalListTile({
    super.key,
    required this.journals,
    required this.onRemoveJournal,
  });

  final List<Journal> journals;
  final void Function(Journal journal) onRemoveJournal;

  @override
  State<JournalListTile> createState() => _JournalListTileState();
}

class _JournalListTileState extends State<JournalListTile> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.journals.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(widget.journals[index]),
        background: Container(
          color: Theme.of(context).colorScheme.errorContainer,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.delete),
              SizedBox(width: 20),
            ],
          ),
        ),
        onDismissed: (direction) {
          widget.onRemoveJournal(widget.journals[index]);
        },
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SavedJournal(journal: widget.journals[index]),
              ),
            );
          },
          child: JournalItem(widget.journals[index]),
        ),
      ),
    );
  }
}