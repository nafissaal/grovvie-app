import 'package:flutter/material.dart';

class ButtonJournal extends StatelessWidget {
  const ButtonJournal({
    super.key,
    required this.onPressedIcon,
  });

  final VoidCallback onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressedIcon,
      icon: const Icon(Icons.question_mark),
    );
  }
}
