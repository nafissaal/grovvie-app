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
];
