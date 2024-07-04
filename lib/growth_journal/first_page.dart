import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    super.key,
    required this.titleController,
    required this.firstStoryController,
    required this.onAddJournal,
  });

  final TextEditingController titleController;
  final TextEditingController firstStoryController;
  final void Function(Journals journal) onAddJournal;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Apa yang kamu pikirkan dan kenapa?',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        const Text(
            'Ceritakan apa yang telah terjadi dan kenapa kamu memiliki pikiran tersebut.Tuliskan alasanmu dengan spesifik.'),
        const SizedBox(height: 20),
        ExpansionTile(
          title: const Text('Contoh'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          children: const <Widget>[
            ListTile(
              title: Text(
                  'Dua hari lagi akan ada ujian. Aku tahu pasti aku akan dapat nilai rendah dan temanku pasti akan menertawakanku. Pasti aku harus mengulang mata kuliah ini.'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          controller: widget.titleController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Judul',
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: widget.firstStoryController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 5,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ceritakan disini...',
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}