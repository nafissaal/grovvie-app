import 'package:cloud_firestore/cloud_firestore.dart';

class CourseContent {
  CourseContent({
    required this.courseId,
    required this.assetUrl,
    required this.title,
    required this.description,
    required this.about,
    this.videoId,
    this.article,
  });

  final String courseId;
  final String assetUrl;
  final String title;
  final String description;
  final String about;
  final String? videoId;
  final String? article;

  static Future<CourseContent?> fromFirestore(String courseId) async {
    final doc = await FirebaseFirestore.instance
        .collection('courses')
        .doc(courseId)
        .get();

    final data = doc.data();

    return CourseContent(
      courseId: doc.id,
      assetUrl: data?['assetUrl'] ?? '',
      title: data?['title'] ?? '',
      description: data?['description'] ?? '',
      about: data?['about'] ?? '',
      videoId: data?['videoId'],
      article: data?['article'],
    );
  }
}









// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CourseContent {
//   CourseContent({
//     required this.courseId,
//     required this.assetUrl,
//     required this.title,
//     required this.description,
//     required this.about,
//     this.videoId,
//     this.article,
//   });

//   final String courseId;
//   final String assetUrl;
//   final String title;
//   final String description;
//   final String about;
//   final String? videoId;
//   final String? article;

//   static Future<CourseContent?> fromFirestore(String courseId) async {
//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('courses')
//           .doc(courseId)
//           .get();

//       if (!doc.exists) {
//         debugPrint('Document does not exist for courseId: $courseId');
//         return null;
//       }

//       final data = doc.data();
//       if (data == null) {
//         debugPrint('No data found in the document for courseId: $courseId');
//         return null;
//       }

//       debugPrint("Data fetched for courseId: $courseId: $data");

//       return CourseContent(
//         courseId: doc.id,
//         assetUrl: data['assetUrl'] ?? 'N/A',
//         title: data['title'] ?? 'N/A',
//         description: data['description'] ?? 'N/A',
//         about: data['about'] ?? 'N/A',
//         videoId: data['videoId'],
//         article: data['article'],
//       );
//     } catch (error) {
//       debugPrint('Error fetching course content for courseId: $courseId: $error');
//       return null;
//     }
//   }
// }
