import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';

class JournalItem extends StatelessWidget {
  const JournalItem(this.journal, {super.key});

  final Journals journal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              journal.title!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Spacer(),
                Text(journal.formattedDate),
              ],
            )
          ],
        ),
      ),
    );
  }
}