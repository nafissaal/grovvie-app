import 'package:flutter/material.dart';

class QuizStart extends StatelessWidget {
  const QuizStart(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(210),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Klik tombol dibawah untuk mengejarkan kuis'),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: startQuiz,
              child: const Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }
}
