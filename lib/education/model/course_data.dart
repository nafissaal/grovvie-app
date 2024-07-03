import 'package:flutter/material.dart';
import 'package:grovvie/navigation/navigation_helper.dart';


enum ContentType {
  video,
  quiz,
  article,
}

class Section {
  Section({
    required this.title,
    required this.description,
    this.videoId,
    this.quizzes,
    required this.about,
    required this.type,
  }) {
    assert(type != ContentType.video || videoId != null,
        'videoId is required for Type.video');
    assert(type != ContentType.quiz || quizzes != null,
        'quizzes is required for Type.quiz');
  }

  final String title;
  final String description;
  final String? videoId;
  final List<Quiz>? quizzes;
  final String about;
  final ContentType type;
}

class Course {
  Course({
    required this.courseId,
    this.sections,
    this.article,
    this.type,
  });

  final String courseId;
  final List<Section>? sections;
  final String? article;
  final ContentType? type;
}

class QuizQuestion {
  const QuizQuestion({
    required this.text,
    required this.answers,
  });

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

class Quiz {
  Quiz({
    required this.quizId,
    required this.questions,
    required this.onPressed,
  });

  final String quizId;
  final List<QuizQuestion> questions;
  final VoidCallback onPressed;
}

List<Course> courses = [
  Course(
    courseId: 'course1',
    sections: [
      Section(
        title: 'Mengembangkan Pikiran',
        description: 'Video - 3:04',
        videoId: 'WtKJrB5rOKs',
        about: 'Video dibuat oleh Khan Academy. Khan Academy adalah organisasi non-profit yang menyediakan pendidikan gratis untuk siapa saja dan di mana saja.',
        type: ContentType.video,
      ),
      Section(
        title: 'Kuis - Mengembangkan Pikiran',
        description: 'Kuis - 5 Pertanyaan',
        about: 'Kuis diadaptasi dari Khan Academy. Khan Academy adalah organisasi non-profit yang menyediakan pendidikan gratis untuk siapa saja dan di mana saja.',
        type: ContentType.quiz,
        quizzes: [
          Quiz(
            quizId: 'quiz1',
            onPressed: () {
              NavigationHelper.router.push('/quizzes/quiz1');
            },
            questions: [
              const QuizQuestion(
                text: 'Bagaimana seseorang menjadi lebih pintar?',
                answers: [
                  'Dengan belajar dari kesalahan dan berusaha terus-menerus',
                  'Dengan beristirahat dan menghindari tantangan',
                  'Dengan mengandalkan keberuntungan',
                ],
              ),
              const QuizQuestion(
                text:
                    'Bagaimana diagram neuron “At birth vs. At Age 6” menunjukkan hal ini?',
                answers: [
                  'Menunjukkan bahwa jumlah koneksi neuron meningkat seiring bertambahnya pengalaman dan pembelajaran',
                  'Menunjukkan bahwa jumlah koneksi neuron tetap sama seiring waktu',
                  'Menunjukkan bahwa neuron menurun jumlahnya seiring waktu',
                ],
              ),
              const QuizQuestion(
                text:
                    'Bagaimana dengan perbandingan diagram saraf hewan yang hidup di dalam kandang dengan hewan yang hidup dengan mainan dan hewan lain?',
                answers: [
                  'Menunjukkan bahwa lingkungan yang kaya dengan stimulasi meningkatkan kompleksitas dan jumlah koneksi saraf',
                  'Menunjukkan bahwa lingkungan tidak mempengaruhi koneksi saraf',
                  'Menunjukkan bahwa hewan yang hidup di kandang memiliki lebih banyak koneksi saraf',
                ],
              ),
              const QuizQuestion(
                text:
                    'Apa karakteristik otak yang sama dengan karakteristik otot?',
                answers: [
                  'Otak menjadi lebih kuat dengan latihan dan penggunaan yang teratur',
                  'Otak tidak berubah dengan latihan',
                  'Otak melemah dengan latihan',
                ],
              ),
              const QuizQuestion(
                text: 'Kapan jaringan pada otak kita tumbuh paling banyak?',
                answers: [
                  'Semua jawaban benar',
                  'Ketika melakukan kesalahan, menganalisisnya, dan belajar darinya',
                  'Ketika melakukan suatu tantangan dan memproses feedback yang didapatkan',
                ],
              ),
            ],
          ),
        ],
      ),
      Section(
        title: 'Kekuatan Sebuah Keyakinan',
        description: 'Video - 10:52',
        videoId: 'pN34FNbOKXc',
        about: 'Video dibuat oleh TEDx Talks. TED adalah organisasi non-profit yang percaya bahwa ide-ide powerful, yang disampaikan dengan powerful, dapat menggerakkan setiap orang: untuk merasakan sesuatu, untuk berpikir secara berbeda, dan untuk mengambil tindakan.',
        type: ContentType.video,
      ),
    ],
  ),
  Course(
    courseId: 'course2',
    article: 'some long article about Growth Mindset Origin',
    type: ContentType.article,
  ),
  Course(
    courseId: 'course3',
    article: 'some long article about Marva Collins',
    type: ContentType.article,
  ),
  Course(
    courseId: 'course4',
    sections: [
      Section(
        title: 'Mengembangkan Growth Mindset',
        description: 'Video - 9:37',
        videoId: 'hiiEeMN7vbQ',
        about: 'Video dibuat oleh TEDx Talks. TED adalah organisasi non-profit yang percaya bahwa ide-ide powerful, yang disampaikan dengan powerful, dapat menggerakkan setiap orang: untuk merasakan sesuatu, untuk berpikir secara berbeda, dan untuk mengambil tindakan.',
        type: ContentType.video,
      ),
    ],
  ),
  Course(
    courseId: 'course5',
    sections: [
      Section(
        title: 'Kamu Bisa Mempelajari Apapun',
        description: 'Video - 9:37',
        videoId: 'JC82Il2cjqA',
        about: 'Video dibuat oleh Khan Academy. Khan Academy adalah organisasi non-profit yang menyediakan pendidikan gratis untuk siapa saja dan di mana saja.',
        type: ContentType.video,
      ),
    ],
  ),
  Course(
    courseId: 'course6',
    article: 'some long article about Fixed Mindset Antidotes',
    type: ContentType.article,
  ),
  Course(
    courseId: 'course7',
    sections: [
      Section(
        title: 'Sukses Melalui Usaha',
        description: 'Video - 9:37',
        videoId: 'LUtcigWSBsw',
        about: 'Video dibuat oleh Khan Academy. Khan Academy adalah organisasi non-profit yang menyediakan pendidikan gratis untuk siapa saja dan di mana saja.',
        type: ContentType.video,
      ),
    ],
  ),
];

List<Quiz> flashcardQuizzes = [
  Quiz(
    quizId: 'flashcardQuiz',
    onPressed: () {
      NavigationHelper.router.push('/quizzes/flashcardQuiz');
    },
    questions: [
      const QuizQuestion(
        text: 'Merasa terancam dengan kesuksesan orang lain',
        answers: [
          'Fixed Mindset',
          'Growth Mindset',
        ],
      ),
      const QuizQuestion(
        text: 'Belajar dari kritik',
        answers: [
          'Growth Mindset',
          'Fixed Mindset',
        ],
      ),
      const QuizQuestion(
        text: 'Kegagalan merupakan sebuah kemunduran yang tidak dapat diterima',
        answers: [
          'Fixed Mindset',
          'Growth Mindset',
        ],
      ),
      const QuizQuestion(
        text: 'Keberhasilan merupakan hasil perkembangan diri',
        answers: [
          'Growth Mindset',
          'Fixed Mindset',
        ],
      ),
      const QuizQuestion(
        text: 'Mudah menyerah',
        answers: [
          'Fixed Mindset',
          'Growth Mindset',
        ],
      ),
      const QuizQuestion(
        text: 'Menerima dan menghadapi tantangan',
        answers: [
          'Growth Mindset',
          'Fixed Mindset',
        ],
      ),
      const QuizQuestion(
        text: 'Berfokus pada pembuktian diri',
        answers: [
          'Fixed Mindset',
          'Growth Mindset',
        ],
      ),
    ],
  ),
];
