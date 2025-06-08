import 'reactions_model.dart';
import 'user_model.dart';

class ReviewModel {
  final int malId;
  final String url;
  final String type;
  final ReactionsModel reactions;
  final DateTime date;
  final String review;
  final int score;
  final List<String> tags;
  final bool isSpoiler;
  final bool isPreliminary;
  final UserModel user;

  const ReviewModel({
    required this.malId,
    required this.url,
    required this.type,
    required this.reactions,
    required this.date,
    required this.review,
    required this.score,
    required this.tags,
    required this.isSpoiler,
    required this.isPreliminary,
    required this.user,
  });

  ReviewModel.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'],
      url = json['url'],
      type = json['type'],
      reactions = ReactionsModel.fromJson(json['reactions']),
      date = DateTime.parse(json['date']),
      review = json['review'],
      score = json['score'],
      tags = (json['tags'] as List).cast<String>(),
      isSpoiler = json['is_spoiler'],
      isPreliminary = json['is_preliminary'],
      user = UserModel.fromJson(json['user']);
}
