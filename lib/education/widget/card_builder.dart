import 'package:flutter/material.dart';
import 'package:grovvie/education/model/course_model.dart';
import 'package:grovvie/navigation/navigation_helper.dart';

class CardBuilder extends StatelessWidget {
  const CardBuilder({
    super.key,
    required this.content,
  });

  final CourseContent content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            splashColor: Theme.of(context).colorScheme.secondaryContainer,
            onTap: () {NavigationHelper.router.push('/courses/${content.courseId}');},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(
                      content.assetUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        content.title,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[800],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          content.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 5),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
