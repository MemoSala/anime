class EpisodeModel {
  final int malId;
  final String? url;
  final String title;
  final String titleJapanese;
  final String? titleRomanji;
  final DateTime aired;
  final double score;
  final bool filler;
  final bool recap;
  final String forumUrl;

  EpisodeModel({
    required this.malId,
    this.url,
    required this.title,
    required this.titleJapanese,
    this.titleRomanji,
    required this.aired,
    required this.score,
    required this.filler,
    required this.recap,
    required this.forumUrl,
  });

  EpisodeModel.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'],
      url = json['url'],
      title = json['title'],
      titleJapanese = json['title_japanese'],
      titleRomanji = json['title_romanji'],
      aired = DateTime.parse(json['aired']),
      score = json['score'].toDouble(),
      filler = json['filler'],
      recap = json['recap'],
      forumUrl = json['forum_url'];
}
