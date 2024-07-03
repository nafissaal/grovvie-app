import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/model/expansion_content.dart';

class ExpansionTileBuilder extends StatelessWidget {
  const ExpansionTileBuilder({
    super.key,
    required this.expansionContent,
  });

  final ExpansionContent expansionContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Text(expansionContent.title), // Access title from widget
          leading: Icon(expansionContent.leadingIcon),
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(expansionContent.description),
            ),
            ListTile(
              title: Text(expansionContent.example),
            ),
          ],
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}