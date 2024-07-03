import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:grovvie/mindset_flashcard/flashcard_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'flashcard_builder.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({super.key});

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  final String flashcardUrl = 'https://www.instagram.com/p/C5fCVxHSvHr/';

  int _currentFlashcardIndex = 0;

  FlashcardData get currentFlashcard => flashcards[_currentFlashcardIndex];

  final FlipCardController _controller = FlipCardController();

  void _showFlashcardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: const Text(
              'Temukan sumbernya! Tekan tombol "Lihat Sumber" di bawah untuk melihat sumber konten flashcard'),
          actions: [
            FilledButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(flashcardUrl))) {
                  await launchUrl(Uri.parse(flashcardUrl));
                } else {
                  throw 'Tidak dapat membuka link $flashcardUrl';
                }
              },
              child: const Text('Sumber'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void nextFlashcard() {
    setState(() {
      _currentFlashcardIndex = (_currentFlashcardIndex + 1) % flashcards.length;
    });
  }

  void flipCard() {
    _controller.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindset Flashcard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showFlashcardDialog,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlashcardBuilder(
                flashcardData: currentFlashcard,
                controller: _controller,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilledButton.icon(
                    onPressed: flipCard,
                    icon: const Icon(
                      Icons.change_circle_outlined,
                    ),
                    label: const Text('Balik'),
                  ),
                  const SizedBox(width: 15),
                  OutlinedButton(
                    onPressed: nextFlashcard,
                    child: const Row(
                      children: [
                        Text('Selanjutnya'),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // if (_quiz != null) // Ensure _quiz is not null before using it
              TextButton(
                // onPressed: widget.quiz!.onPressed,
                onPressed: () {},
                child: const Text('Kerjakan kuis'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
