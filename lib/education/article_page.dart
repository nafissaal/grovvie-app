import 'package:flutter/material.dart';
import 'package:grovvie/education/model/course_model.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({
    super.key,
    required this.content,
  });

  final CourseContent content;

  @override
  Widget build(BuildContext context) {
    final paragraphs = content.article?.replaceAll('_b', '\n\n');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showArticleDialog(context, content),
          )
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            Column(
              children: [
                Text(
                  content.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  paragraphs!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showArticleDialog(BuildContext context, CourseContent content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Referensi'),
          content: Text(content.about),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
