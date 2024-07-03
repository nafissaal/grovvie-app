import 'package:flutter/material.dart';

class ExpansionContent {
  ExpansionContent({
    required this.leadingIcon,
    required this.title,
    required this.description,
    required this.example,
  });

  final IconData leadingIcon;
  final String title;
  final String description;
  final String example;
}

List<ExpansionContent> expansionContents = [
  ExpansionContent(
    title: 'All-or-None Judgment',
    leadingIcon: Icons.gavel_rounded,
    description:
        'Menilai diri sendiri dengan ekstrem, baik terlalu positif atau negatif.',
    example:
        'Contoh: Aku jenius / Aku bodoh, Aku superior / Aku inferior, Aku terbaik / Aku terburuk',
  ),
  ExpansionContent(
    title: 'Viewing Efforts Negatively',
    leadingIcon: Icons.remove_circle_outline,
    description:
        'Meremehkan usaha, mengharapkan kesuksesan datang dengan mudah (the more you try, the less talented you are).',
    example:
        'Contoh: Ini seharusnya mudah, Seharusnya ini dapat dikerjakan tanpa perjuangan, Aku tidak mau mereka melihatku kesusahan melakukan ini',
  ),
  ExpansionContent(
    title: 'Perfectionist',
    leadingIcon: Icons.emoji_events,
    description:
        'Apapun yang kurang dari 100% tidak dapat diterima. Semua adalah terbaik atau terburuk, tidak ada yang di tengah-tengah. Fixed mindset mengatakan bahwa jika kamu jenius, istimewa, / superior, progres seharusnya cepat & sempurna.',
    example:
        'Contoh: Karyaku adalah yang terbaik, Aku harus mengerjakan dengan sempurna, Ini sangat tidak bagus',
  ),
  ExpansionContent(
    title: 'Magnification / Minimization',
    leadingIcon: Icons.zoom_in,
    description:
        'Memperbesar kesalahan dan membuat prediksi ekstrem tentang dampak kesalahanmu. Atau mengabaikan kesalahan karena menganggap kesalahan sebagai kelemahan.',
    example:
        'Contoh: Ini akan menghancurkan hidupku! Ini tidak akan pernah pulih!',
  ),
  ExpansionContent(
    title: 'Viewing Others as Judges',
    leadingIcon: Icons.supervisor_account_outlined,
    description:
        'Mencari validasi dari orang lain, mengartikan pujian dan kritik dengan all-or-none judegement, berasumsi bahwa orang lain selalu menilaimu.',
    example:
        'Contoh: Dia berpikir aku pintar/bodoh, Dia berpikir aku rupawan/jelek',
  ),
  ExpansionContent(
    title: 'Destructive Comparisons',
    leadingIcon: Icons.compare_arrows_rounded,
    description:
        'Fixed Mindset membandingkan diri sendiri secara kompetitif dengan keberhasilan atau kegagalan orang lain, menghubungkan nilai pribadi berdasarkan hasil orang lain.',
    example:
        'Contoh: Aku lebih baik/buruk dari dia, Aku lebih pintar/bodoh dibandingkan dia',
  ),
];