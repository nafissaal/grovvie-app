import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/model/instruction_data.dart';
import 'package:grovvie/growth_journal/widgets/instruction_card.dart';
import 'package:grovvie/growth_journal/widgets/journal_card.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    super.key,
    required this.firstStoryController,
    required this.selectedPatterns,
    required this.newStoryController,
  });

  final TextEditingController newStoryController;
  final TextEditingController firstStoryController;
  final List<String> selectedPatterns;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ceritamu',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        JournalCard(journalCardContent: firstStoryController.text),
        const SizedBox(height: 20),
        Text(
          'Pola Fixed Mindset',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        for (var pattern in selectedPatterns) JournalCard(journalCardContent: pattern),
        const SizedBox(height: 20),
        Text(
          'Ayo perbaiki pikiranmu 😉',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 378,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final data in data) InstructionCard(data: data),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
            'Lihat contoh diatas, tulis ulang kekhawatiranmu dan ubah pemikiranmu ke arah pertumbuhan.'),
        const SizedBox(height: 20),
        ExpansionTile(
          title: const Text('Contoh'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          children: const <Widget>[
            ListTile(
              title: Text(
                  'Aku tidak yakin 100% bahwa aku akan gagal pada ujian yang akan datang. Mungkin aku dapat menjawab beberapa soal dengan benar. Meskipun aku tidak mengerjakannya dengan baik, itu tidak berarti aku tidak dapat memperbaiki nilaiku.'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          controller: newStoryController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 5,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ketik disini...',
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
