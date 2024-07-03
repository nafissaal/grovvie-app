import 'package:flutter/material.dart';
import 'package:grovvie/education/model/course_data.dart';
import 'package:grovvie/education/widget/quiz_start.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  YoutubePlayerController? _controller;
  late Course _course;
  late int _selectedSectionIndex = 0;
  late Section _selectedSection;
  Quiz? _quiz;

  @override
  void initState() {
    super.initState();

    _course =
        courses.firstWhere((course) => course.courseId == widget.courseId);

    if (_course.sections != null && _course.sections!.isNotEmpty) {
      // _selectedSectionIndex = 0;
      _selectedSection = _course.sections![_selectedSectionIndex];

      if (_selectedSection.type == ContentType.video &&
          _selectedSection.videoId != null) {
        _controller = YoutubePlayerController(
          params: const YoutubePlayerParams(
            captionLanguage: 'id',
            showControls: true,
            mute: false,
            showFullscreenButton: true,
            loop: false,
            interfaceLanguage: 'id',
            showVideoAnnotations: false,
          ),
        );

        _controller!.load(
          baseUrl: _selectedSection.videoId,
          params: _controller!.params,
        );
      }
    }
  }

  void _onSectionTap(int index) {
    if (_course.sections != null && _course.sections!.isNotEmpty) {
      setState(() {
        _selectedSectionIndex = index;
        _selectedSection = _course.sections![index];
      });
    }

    if (_selectedSection.type == ContentType.quiz &&
        _selectedSection.quizzes != null &&
        _selectedSection.quizzes!.isNotEmpty) {
      _quiz = _selectedSection.quizzes!.first;
    } else {
      _quiz = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [];

    if (_course.sections != null) {
      for (var section in _course.sections!) {
        items.add({'type': 'section', 'data': section});
      }
    }

    return YoutubePlayerScaffold(
      builder: (context, player) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    if (_selectedSection.type == ContentType.video &&
                        _selectedSection.videoId != null &&
                        _controller != null)
                      player,
                    if (_selectedSection.type == ContentType.quiz &&
                        _quiz != null)
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: QuizStart(_quiz!.onPressed),
                      ),
                    const TabBar(
                      tabs: <Widget>[
                        Tab(text: 'Materi'),
                        Tab(text: 'Tentang'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          if (_course.sections != null &&
                              _course.sections!.isNotEmpty)
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final section = items[index]['data'] as Section;
                                return ListTile(
                                  title: Text(section.title),
                                  subtitle: Text(section.description),
                                  tileColor: index == _selectedSectionIndex
                                      ? Colors.purple.shade100
                                      : null,
                                  onTap: () => _onSectionTap(index),
                                );
                              },
                            ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(_selectedSection.about),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
      controller: _controller!,
    );
  }
}
