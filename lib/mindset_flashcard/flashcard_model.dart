class FlashcardData {
  FlashcardData({
    required this.title,
    required this.fixedMindset,
    required this.growthMindset,
  });

  final String title;
  final String fixedMindset;
  final String growthMindset;
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

List<FlashcardData> flashcards = [
  FlashcardData(
    title: 'Fokus',
    fixedMindset: 'Berfokus pada pembuktian diri',
    growthMindset: 'Berfokus pada proses dan pengembangan diri',
  ),
  FlashcardData(
    title: 'Tantangan',
    fixedMindset: 'Menghindari tantangan',
    growthMindset: 'Menerima dan menghadapi tantangan',
  ),
  FlashcardData(
    title: 'Rintangan',
    fixedMindset: 'Mudah menyerah',
    growthMindset: 'Berusaha melalui tantangan',
  ),
  FlashcardData(
    title: 'Keberhasilan',
    fixedMindset: 'Keberhasilan adalah bukti bahwa diri pintar / berbakat',
    growthMindset: 'Keberhasilan merupakan hasil perkembangan diri',
  ),
  FlashcardData(
    title: 'Kegagalan',
    fixedMindset: 'Kegagalan merupakan sebuah kemunduran, tidak dapat diterima',
    growthMindset:
        'Kegagalan disebabkan oleh belum mencapai potensi penuh, dan dapat belajar serta tumbuh darinya',
  ),
  FlashcardData(
    title: 'Kritik',
    fixedMindset: 'Tidak mendengarkan kritik',
    growthMindset: 'Belajar dari kritik',
  ),
  FlashcardData(
    title: 'Kesuksesan Orang Lain',
    fixedMindset: 'Merasa terancam dengan kesuksesan orang lain',
    growthMindset: 'Merasa terinspirasi dan belajar dari kesuksesan orang lain',
  ),
  FlashcardData(
    title: 'Kesalahan',
    fixedMindset: 'Kesalahan adalah tanda kegagalan',
    growthMindset:
        'Kesalahan adalah hal wajar dan peluang untuk mempelajari hal baru',
  ),
];

const flashcardQuizzes = [
  QuizQuestion(
    text: 'Merasa terancam dengan kesuksesan orang lain',
    answers: [
      'Fixed Mindset',
      'Growth Mindset',
    ],
  ),
  QuizQuestion(
    text: 'Belajar dari kritik',
    answers: [
      'Growth Mindset',
      'Fixed Mindset',
    ],
  ),
  QuizQuestion(
    text: 'Kegagalan merupakan sebuah kemunduran yang tidak dapat diterima',
    answers: [
      'Fixed Mindset',
      'Growth Mindset',
    ],
  ),
  QuizQuestion(
    text: 'Keberhasilan merupakan hasil perkembangan diri',
    answers: [
      'Growth Mindset',
      'Fixed Mindset',
    ],
  ),
  QuizQuestion(
    text: 'Mudah menyerah',
    answers: [
      'Fixed Mindset',
      'Growth Mindset',
    ],
  ),
  QuizQuestion(
    text: 'Menerima dan menghadapi tantangan',
    answers: [
      'Growth Mindset',
      'Fixed Mindset',
    ],
  ),
  QuizQuestion(
    text: 'Berfokus pada pembuktian diri',
    answers: [
      'Fixed Mindset',
      'Growth Mindset',
    ],
  ),
  QuizQuestion(
    text: 'Kesalahan adalah hal wajar dan peluang untuk mempelajari hal baru',
    answers: [
      'Growth Mindset',
      'Fixed Mindset',
    ],
  ),
];
