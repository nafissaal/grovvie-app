class InstructionData {
  InstructionData({
    required this.cardName,
    required this.description,
    required this.exampleFM,
    required this.exampleGM,
  });

  final String cardName;
  final String description;
  final String exampleFM;
  final String exampleGM;
}

List<InstructionData> data = [
  InstructionData(
    cardName: 'All-or-None Judgement',
    description:
        'Apakah ini yang sebenarnya terjadi? Apa yang bisa dilakukan untuk peningkatan?',
    exampleFM: 'Nilaiku turun, aku sangat bodoh.',
    exampleGM:
        'Nilaiku memang turun, di semester ini aku banyak mengikuti kegiatan volunteer. Kedepannya, aku akan lebih baik dalam memanajemen waktu.',
  ),
  InstructionData(
    cardName: 'Viewing Efforts Negatively',
    description:
        'Jika kamu berusaha keras bukan berarti kamu tidak berbakat, semakin keras kamu mencoba maka semakin besar peluangmu untuk peningkatan.',
    exampleFM: 'Ini susah sekali, tidak mungkin bisa diselesaikan.',
    exampleGM:
        'Ini mungkin tidak mudah, aku akan terus mencoba berusaha dan meminta bimbingan pada teman yang sudah bisa.',
  ),
  InstructionData(
    cardName: 'Perfectionist',
    description:
        'Berapa level skillku saat ini? Apa langkah yang tepat untuk maju secara bertahap?',
    exampleFM: 'Tugas yang aku kerjakan sangat jauh dari sempurna.',
    exampleGM:
        'Aku sudah meluangkan waktu berjam-jam untuk tugas ini. Aku bisa melanjutkan, tetapi ada hal lain yang juga harus aku lakukan. Aku akan mengumpulkan tugas ini, dan menunggu hasilnya, lalu mengevaluasi pendekatanku dalam mengerjakannya.',
  ),
  InstructionData(
    cardName: 'Magnification / Minimization',
    description:
        'Bagaimana ini bisa terjadi? Apa yang bisa dipelajari? Gimana agar bisa meningkat? Kedepannya, langkah apa yang diambil?',
    exampleFM: 'Kesalahan yang bodoh, ini tidak mungkin diperbaiki.',
    exampleGM:
        'Aku telah melakukan kesalahan. Ini terjadi karena aku tidak bertanya dulu. Kedepannya, aku akan bertanya lebih dulu. Ini bisa jadi lebih buruk lagi, tapi sekarang belum seburuk itu. Aku akan memperbaikinya.',
  ),
  InstructionData(
    cardName: 'Viewing Others as Judges',
    description:
        'Apa yang bisa dipelajari dari mereka? Bagaimana dia dapat membantuku meningkatkan keterampilan? Bagaimana caranya dapat feedback yang bermanfaat dan spesifik dari mereka?',
    exampleFM: 'Dia pasti berpikir aku tidak kompeten.',
    exampleGM:
        'Aku sebenarnya tidak tahu apa yang dia pikirkan. Apa yang ia pikir tidak lebih penting dibandingkan dengan mencari masukan dan membuat rencana untuk meningkatkan keterampilanku.',
  ),
  InstructionData(
    cardName: 'Destructive Comparisons',
    description:
        'Gimana itu terjadi? Apa yang dilakukan? Seberapa sering mereka berlatih? Apa yang mereka gunakan? Apa yang bisa aku pelajari dari pengalaman mereka?',
    exampleFM: 'Dia sangat pintar, tidak mungkin aku dapat menyainginya.',
    exampleGM:
        'Ada banyak orang di kelas ini dengan pengalaman dan latar belakang pendidikan yang berbeda. Aku akan menggunakan kesempatan ini untuk bekerjasama dan saling meningkatkan keterampilan.',
  ),
];
