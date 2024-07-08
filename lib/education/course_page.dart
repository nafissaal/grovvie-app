import 'package:flutter/material.dart';
import 'package:grovvie/education/article_page.dart';
import 'package:grovvie/education/model/course_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({
    super.key,
    required this.content,
  });

  final CourseContent content;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.content.videoId != null) {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: widget.content.videoId!,
        autoPlay: true,
        params: const YoutubePlayerParams(
          captionLanguage: 'en',
          showControls: true,
          mute: false,
          showFullscreenButton: true,
          interfaceLanguage: 'id',
        ),
      );
      _controller?.loadVideoById(videoId: widget.content.videoId!);
    } else {
      _controller = null;
    }
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.content.article != null) {
      return ArticlePage(content: widget.content);
    }

    if (_controller != null) {
      return YoutubePlayerScaffold(
        controller: _controller!,
        builder: (BuildContext context, Widget player) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ListView(
                    children: [
                      player,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.content.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 20),
                            Text(widget.content.about),

                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.content.title),
        ),
        body: const Center(
          child: Text('No video available'),
        ),
      );
    }
  }
}
