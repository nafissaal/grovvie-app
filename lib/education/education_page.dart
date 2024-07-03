import 'package:flutter/material.dart';
import 'package:grovvie/education/model/card_content.dart';
import 'package:grovvie/education/widget/card_builder.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edukasi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (final content in contents) CardBuilder(content: content),
          ],
        ),
      ),
    );
  }
}
