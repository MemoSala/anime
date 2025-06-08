import 'images_model.dart';

class NewsModel {
  final int malId;
  final String url;
  final String title;
  final DateTime date;
  final String authorUsername;
  final String authorUrl;
  final String forumUrl;
  final ImageModel? image;
  final int comments;
  final String excerpt;

  const NewsModel({
    required this.malId,
    required this.url,
    required this.title,
    required this.date,
    required this.authorUsername,
    required this.authorUrl,
    required this.forumUrl,
    required this.image,
    required this.comments,
    required this.excerpt,
  });

  NewsModel.fromJson(Map<String, dynamic> json)
    : malId = json["mal_id"],
      url = json["url"],
      title = json["title"],
      date = DateTime.parse(json["date"]),
      authorUsername = json["author_username"],
      authorUrl = json["author_url"],
      forumUrl = json["forum_url"],
      image =
          json["images"]["jpg"]["image_url"] == null
              ? null
              : ImageModel.fromJson(json["images"]["jpg"]),
      comments = json["comments"],
      excerpt = json["excerpt"];
}
