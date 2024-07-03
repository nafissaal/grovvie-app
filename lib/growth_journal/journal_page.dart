import 'package:flutter/material.dart';
import 'package:grovvie/growth_journal/first_page.dart';
import 'package:grovvie/growth_journal/model/expansion_content.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';
import 'package:grovvie/growth_journal/second_page.dart';
import 'package:grovvie/growth_journal/third_page.dart';
import 'package:grovvie/growth_journal/widgets/button_journal.dart';
import 'package:grovvie/growth_journal/widgets/expansion_tile_builder.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key, required this.onAddJournal});

  final void Function(Journal journal) onAddJournal;

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  int currentStep = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _firstStoryController = TextEditingController();
  final TextEditingController _newStoryController = TextEditingController();
  List<String> _selectedPatterns = [];

  void _alertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pemberitahuan'),
          content: const Text(
              'Setiap sesi harus diisi terlebih dahulu sebelum berpindah ke sesi lain'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _lastAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pemberitahuan'),
          content: const Text(
              'Ini adalah sesi terakhir. Klik OK untuk menyimpan, jurnal tidak dapat diedit setelah disimpan.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                _submitJournalData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _dialogFirst() => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Growth Journal'),
          content: const Text(
              'Growth Journal adalah jurnal yang siap bantu kamu mengenali pola fixed mindset , lalu mengajakmu menuju cara berpikir yang lebih positif dan berkembang. \n \nContohnya, besok adalah hari pertamamu bekerja, kamu khawatir kemampuanmu paling rendah. Tetapi, berasumsi seperti itu hanya akan membuatmu cemas. Sebaliknya, penting untuk menyadari bahwa terdapat salah satu pola Fixed Mindset pada pikiranmu, yaitu All-or-None Judgement (menilai diri sendiri dengan ekstrem). Seharusnya, kamu fokus pada bagaimana kamu dapat meningkatkan kemampuanmu. Dan, mungkin kemampuanmu tidak serendah itu, serta selalu ada orang yang dapat membantumu!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );

  void _dialogSecond() => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog.fullscreen(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Pola Fixed Mindset'),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: <Widget>[
                const Text(
                    'Fixed mindset adalah keyakinan bahwa seseorang memiliki kemampuan atau sifat tertentu dan hanya sedikit hal yang dapat dilakukan untuk mengubahnya.\n \nKamu dapat mengenali fixed mindset dengan melihat pola-pola berikut:'),
                const SizedBox(height: 20),
                for (final expansionContent in expansionContents)
                  ExpansionTileBuilder(
                    expansionContent: expansionContent,
                  ),
              ],
            ),
          ),
        ),
      );

  void _dialogThird() => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Perbaiki cara pikir'),
          content: const Text(
              'Berikut adalah pertanyaan yang dapat membantumu berpikir secara lebih seimbang dan mengurangi kecemasanmu:\n\nApa efek dari mempercayai pikiran ini? Apa yang akan terjadi jika aku tidak mempercayai pikiran ini?\n\nApa bukti yang mendukung pikiranku? Apa bukti yang menentang pikiranku?\n\nApakah ada penjelasan alternatif?\n\nApa hal terburuk yang dapat terjadi dan apakah aku akan survive? Apa hal terbaik yang dapat terjadi? Apa skenario yang paling mungkin terjadi?\n\nJika temanku ada di situasi ini, apa yang akan aku katakan kepadanya?\n\nApa yang bisa aku lakukan terhadap hal ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );

  void _submitJournalData() {
    widget.onAddJournal(
      Journal(
        title: _titleController.text,
        firstStory: _firstStoryController.text,
        newStory: _newStoryController.text,
        date: DateTime.now(),
        selectedPatterns: _selectedPatterns,
        id: '',
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Growth Journal'),
      ),
      body: Center(
        child: Stepper(
          type: StepperType.horizontal,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (currentStep == 0)
                  ButtonJournal(onPressedIcon: _dialogFirst),
                if (currentStep == 1)
                  ButtonJournal(onPressedIcon: _dialogSecond),
                if (currentStep == 2)
                  ButtonJournal(onPressedIcon: _dialogThird),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if ((currentStep == 0 &&
                              (_titleController.text.isEmpty ||
                                  _firstStoryController.text.isEmpty)) ||
                          (currentStep == 1 && _selectedPatterns.isEmpty) ||
                          (currentStep == 2 &&
                              _newStoryController.text.isEmpty)) {
                        _alertDialog();
                      } else {
                        if (currentStep < getSteps().length - 1) {
                          setState(() {
                            currentStep += 1;
                          });
                        } else {
                          _lastAlert();
                        }
                      }
                    },
                    child: const Text('Selanjutnya'),
                  ),
                ),
                const SizedBox(width: 10),
                if (currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          currentStep -= 1;
                        });
                      },
                      child: const Text('Kembali'),
                    ),
                  ),
              ],
            );
          },
          currentStep: currentStep,
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() {
                currentStep -= 1;
              });
            }
          },
          onStepContinue: () {
            bool isLastStep = (currentStep == getSteps().length - 1);
            if (isLastStep) {
              _submitJournalData();
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepTapped: (step) {
            if ((currentStep == 0 &&
                    (_titleController.text.isEmpty ||
                        _firstStoryController.text.isEmpty)) ||
                (currentStep == 1 && _selectedPatterns.isEmpty) ||
                (currentStep == 2 && _newStoryController.text.isEmpty)) {
              _alertDialog();
            } else {
              setState(() {
                currentStep = step;
              });
            }
          },
          steps: getSteps(),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text(
          'Tuangkan\npikiran',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        content: FirstPage(
          titleController: _titleController,
          firstStoryController: _firstStoryController,
          onAddJournal: widget.onAddJournal,
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text(
          'Temukan\npola',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        content: SecondPage(
            firstStoryController: _firstStoryController,
            selectedPatterns: _selectedPatterns,
            onPatternSelected: (patterns) {
              setState(() {
                _selectedPatterns = patterns;
              });
            }),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text(
          'Perbaiki\ncara pikir',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        content: ThirdPage(
          newStoryController: _newStoryController,
          selectedPatterns: _selectedPatterns,
          firstStoryController: _firstStoryController,
        ),
      ),
    ];
  }
}
