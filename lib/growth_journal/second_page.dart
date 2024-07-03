import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/widgets/checkbox_builder.dart';
import 'package:grovvie/growth_journal/widgets/journal_card.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
    required this.firstStoryController,
    required this.selectedPatterns,
    required this.onPatternSelected,
  });

  final TextEditingController firstStoryController;
  final List<String> selectedPatterns;
  
  final Function(List<String>) onPatternSelected;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<String> _patterns = [
    'All-or-None Judgement',
    'Viewing Efforts Negatively',
    'Perfectionist',
    'Magnification/Minimization',
    'Viewing Others as Judges',
    'Destructive Comparisons'
  ];

  void _onPatternSelected(String selectedPattern, bool selected) {
    setState(() {
      if (selected) {
        widget.selectedPatterns.add(selectedPattern);
      } else {
        widget.selectedPatterns.remove(selectedPattern);
      }
      widget.onPatternSelected(widget.selectedPatterns);
    });
  }

  // List<bool> checkboxValues = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ceritamu',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        JournalCard(journalCardContent: widget.firstStoryController.text),
        const SizedBox(height: 20),
        Text(
          'Pilih pola',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        const Text(
            'Pilih pola fixed mindset yang berhubungan dengan kekhawatiranmu.'),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _patterns.length,
          itemBuilder: (context, index) {
            final currentPattern = _patterns[index];

            return CheckboxBuilder(
              title: currentPattern,
              value: widget.selectedPatterns.contains(currentPattern),
              // checkboxValues[index],
              onChanged: (bool? selected) {
                if (selected != null) {
                  _onPatternSelected(currentPattern, selected);
                }
              },
              // (value) {
              //   setState(() {
              //     checkboxValues[index] = value!;
              //   });
              // },
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}