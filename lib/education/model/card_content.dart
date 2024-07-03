import 'package:flutter/material.dart';
import 'package:grovvie/navigation/navigation_helper.dart';

class CardContent {
  CardContent({
    required this.courseId,
    required this.assetName,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String courseId;
  final String assetName;
  final String title;
  final String description;
  final VoidCallback onTap;
}

List<CardContent> contents = [
  CardContent(
    courseId: 'course1',
    assetName: 'assets/images/growth-mindset-introduction.png',
    title: 'Pengenalan Growth Mindset',
    description: 'Memperkenalkan konsep pengembangan kecerdasan',
    onTap: () {
      NavigationHelper.router.push('/courses/course1');
    },
  ),
  CardContent(
    courseId: 'course2',
    assetName: 'assets/images/growth-mindset-origin.png',
    title: 'Jenis-Jenis Mindset',
    description: 'Kunci mengubah kegagalan menjadi kesuksesan',
    onTap: () {
      NavigationHelper.router.push('/courses/course2');
    },
  ),
  CardContent(
    courseId: 'course3',
    assetName: 'assets/images/marva-collins.jpeg',
    title: 'Marva Collins',
    description: 'Kisah seorang pendidik inspiratif',
    onTap: () {
      NavigationHelper.router.push('/courses/course3');
    },
  ),
  CardContent(
    courseId: 'course4',
    assetName: 'assets/images/developing-a-growth-mindset.png',
    title: 'Mengembangkan Growth Mindset',
    description: 'Kekuatan "belum"',
    onTap: () {
      NavigationHelper.router.push('/courses/course3');
    },
  ),
  CardContent(
    courseId: 'course5',
    assetName: 'assets/images/you-can-learn-anything.png',
    title: 'Kamu Bisa Mempelajari Apapun',
    description: 'Awalnya kamu tidak tahu hasil dari 1+1, tapi sekarang kamu tahu',
    onTap: () {
      NavigationHelper.router.push('/courses/course3');
    },
  ),
  CardContent(
    courseId: 'course6',
    assetName: 'assets/images/fixed-mindset-antidote.png',
    title: 'Pola Fixed Mindset dan Penangkalnya',
    description: 'Resep untuk menghadapi fixed mindset',
    onTap: () {
      NavigationHelper.router.push('/courses/course3');
    },
  ),
  CardContent(
    courseId: 'course7',
    assetName: 'assets/images/success-through-effort.png',
    title: 'Sukses Melalui Usaha',
    description: 'Kisah dari John Legend',
    onTap: () {
      NavigationHelper.router.push('/courses/course3');
    },
  ),
];
