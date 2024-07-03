import 'package:flutter/material.dart';

class JournalCard extends StatelessWidget {
  const JournalCard({super.key, required this.journalCardContent});

  final String journalCardContent;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            journalCardContent,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}