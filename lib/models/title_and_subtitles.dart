class TitleAndSubtitles {
  final String title;
  final List<String> subtitles;
   bool? isExpanded;
  TitleAndSubtitles( {
    required this.title,
    required this.subtitles,
    this.isExpanded=false
  });
}

List<TitleAndSubtitles> allTitleAndSubtitles = [
  TitleAndSubtitles(
    title: 'Город',
    subtitles: [
      'Бишкек',
      'Талас',
    ],
  ),
  TitleAndSubtitles(
    title: 'Район',
    subtitles: [
      'Свердловский',
      'Ленинский',
    ],
  ),
  TitleAndSubtitles(
    title: 'По услуге',
    subtitles: [
      'Вывоз мусора',
      'Вода и стоки',
    ],
  ),
  TitleAndSubtitles(
    title: 'Периодичность отправки',
    subtitles: [
      'В конце каждого месяца',
      'В конце квартала',
      'В конце года',
      'Каждую неделю после просрочки',
    ],
  ),
];
