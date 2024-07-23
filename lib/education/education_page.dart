import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grovvie/education/model/course_model.dart';
import 'package:grovvie/education/widget/card_builder.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  Future<List<CourseContent>> _fetchCourses() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('courses').get();

    final List<CourseContent> courses = [];
    for (final doc in querySnapshot.docs) {
      final course = await CourseContent.fromFirestore(doc.id);
      if (course != null) {
        courses.add(course);
      }
    }
    return courses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edukasi'),
      ),
      body: FutureBuilder<List<CourseContent>>(
        future: _fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final courses = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                for (final content in courses) CardBuilder(content: content),
              ],
            ),
          );
        },
      ),
    );
  }
}
