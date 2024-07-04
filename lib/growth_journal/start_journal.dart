import 'package:flutter/material.dart';
import 'package:grovvie/firestore_service.dart';
import 'package:grovvie/growth_journal/journal_page.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';
import 'package:grovvie/growth_journal/widgets/journal_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class StartJournal extends StatefulWidget {
  const StartJournal({super.key});

  @override
  State<StartJournal> createState() => _StartJournalState();
}

class _StartJournalState extends State<StartJournal> {
  final String jurnalUrl = 'https://blog.mindsetworks.com/what-s-my-mindset';
  final FirestoreService _firestoreService = FirestoreService();

  void _showJournalDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: const Text(
              'Setelah mengisi jurnal minimal 5 kali, kamu dapat melakukan self-assesment dengan klik tombol "Kerjakan Tes". Tombol ini akan membuka halaman website Mindset Works.'),
          actions: [
            FilledButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(jurnalUrl))) {
                  await launchUrl(Uri.parse(jurnalUrl));
                } else {
                  throw 'Tidak dapat membuka link $jurnalUrl';
                }
              },
              child: const Text('Kerjakan Tes'),
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

  Future<void> _addJournal(Journals journal) async {
    await _firestoreService.addJournal(journal);
  }

  Future<void> removeJournal(String journalId) async {
    await _firestoreService.deleteJournal(journalId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Growth Journal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: _showJournalDialog,
          )
        ],
      ),
      body: StreamBuilder<List<Journals>>(
        stream: _firestoreService.getUserJournals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            final journals = snapshot.data!;
            if (journals.isNotEmpty) {
              return JournalListTile(
                journals: journals,
                onRemoveJournal: (Journals journal) async {
                  await removeJournal(journal.id!);
                },
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Isi jurnal ini jika kamu merasa tidak puas, takut, cemas, atau emosi negatif lainnya. Jurnal ini lebih baik digunakan sebagai pendaping terapi, tunjukkan jurnal ini ke terapis pada saat konsultasi.',
                        style: Theme.of(context).textTheme.labelSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => JournalPage(
                                onAddJournal: _addJournal,
                              ),
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Mulai'),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }

          return const Center(child: Text('Unknown error'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => JournalPage(
                onAddJournal: _addJournal,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
