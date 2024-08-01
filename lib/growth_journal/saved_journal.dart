import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:grovvie/growth_journal/model/journal_model.dart';
import 'package:grovvie/growth_journal/widgets/journal_card.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SavedJournal extends StatefulWidget {
  const SavedJournal({
    super.key,
    required this.journal,
  });

  final Journals journal;

  @override
  State<SavedJournal> createState() => _SavedJournalState();
}

class _SavedJournalState extends State<SavedJournal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.journal.title!,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.print_outlined),
            onPressed: () {
              Printing.layoutPdf(
                onLayout: (PdfPageFormat format) {
                  return buildPdf(format);
                },
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Text(
            'Ceritamu',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          JournalCard(journalCardContent: widget.journal.firstStory!),
          const SizedBox(height: 20),
          Text(
            'Pola Fixed Mindset',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          for (var pattern in widget.journal.selectedPatterns!)
            JournalCard(journalCardContent: pattern),
          const SizedBox(height: 20),
          Text(
            'Pemikiran baru',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          JournalCard(journalCardContent: widget.journal.newStory!),
        ],
      ),
    );
  }

  Future<Uint8List> buildPdf(PdfPageFormat format) async {
    final pw.Document doc =
        pw.Document(title: 'jurnal $widget.journal.formattedDate');
    final image = pw.MemoryImage(
        (await rootBundle.load('assets/images/app-logo.png'))
            .buffer
            .asUint8List());

    doc.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Image(
                image,
                height: 40,
                width: double.infinity,
              ),
               pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    widget.journal.title!,
                    style: const pw.TextStyle(fontSize: 30),
                  ),
                  pw.Text(widget.journal.formattedDate),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Text(
                'Ceritamu',
                style: const pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              pw.Container(
                child: pw.Text(widget.journal.firstStory!),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Pola Fixed Mindset',
                style: const pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              for (var pattern in widget.journal.selectedPatterns!)
                pw.Container(
                  child: pw.Text(pattern),
                ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Pemikiran baru',
                style: const pw.TextStyle(fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              pw.Container(
                child: pw.Text(widget.journal.newStory!),
              ),
            ],
          );
        },
      ),
    );

    return await doc.save();
  }
}
