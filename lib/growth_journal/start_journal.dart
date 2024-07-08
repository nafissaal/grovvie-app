import 'package:flutter/material.dart';
import 'package:grovvie/application_state.dart';
import 'package:grovvie/firestore_service.dart';
import 'package:grovvie/growth_journal/journal_page.dart';
import 'package:grovvie/growth_journal/model/journal_model.dart';
import 'package:grovvie/growth_journal/widgets/journal_list_tile.dart';
import 'package:provider/provider.dart';
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

  Future<void> _removeJournal(Journals journal) async {
    final deletedJournal = journal;

    await _firestoreService.deleteJournal(journal.id!);

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Jurnal berhasil dihapus'),
        action: SnackBarAction(
          label: 'Batal',
          onPressed: () async {
            await _firestoreService.addJournal(deletedJournal);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ApplicationState>().currentUser;

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
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : StreamBuilder<List<Journals>>(
              stream: _firestoreService.getUserJournals(user.uid),
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
                        await _removeJournal(journal);
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
      floatingActionButton: user == null
          ? null
          : FloatingActionButton(
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
