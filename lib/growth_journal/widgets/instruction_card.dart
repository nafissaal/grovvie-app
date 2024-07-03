import 'package:flutter/material.dart';

import '../model/instruction_data.dart';

class InstructionCard extends StatelessWidget {
  const InstructionCard({
    super.key,
    required this.data,
  });

  final InstructionData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: 300,
        height: 378,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                data.cardName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.description,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Fixed Mindset',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.exampleFM,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Growth Mindset',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(data.exampleGM),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}