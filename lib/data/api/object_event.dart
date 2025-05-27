part of 'object_bloc.dart';

@immutable
abstract class ObjectEvent {}

class AnimesInitialFatchEvent extends ObjectEvent {
  AnimesInitialFatchEvent({
    /// This is a flag. When supplied it will include entries which are unapproved. Unapproved entries on MyAnimeList are those that are user submitted and have not yet been approved by MAL to show up on other pages. They will have their own specifc pages and are often removed resulting in a 404 error. You do not need to pass a value to it. e.g usage: ?unapproved
    bool? unapproved,
    this.page,
    this.limit,
    this.q,
    this.type,
    this.score,
    this.minScore,
    this.maxScore,
    this.rating,

    /// Filter out Adult entries
    bool sfw = true,
    this.genres,
    this.genresExclude,
    this.orderBy,
    this.sort,
    this.letter,
    this.producers,
    this.startDate,
    this.endDate,
  }) : _sfw = sfw,
       _unapproved = unapproved;

  /// This is a flag. When supplied it will include entries which are unapproved. Unapproved entries on MyAnimeList are those that are user submitted and have not yet been approved by MAL to show up on other pages. They will have their own specifc pages and are often removed resulting in a 404 error. You do not need to pass a value to it. e.g usage: ?unapproved
  final bool? _unapproved;
  String? get unapproved =>
      _unapproved != null
          ? _unapproved
              ? "true"
              : "false"
          : null;

  final int? page, limit;

  /// Filter by title Anime
  final String? q;

  /// Enum: "tv" "movie" "ova" "special" "ona" "music" "cm" "pv" "tv_special"
  /// Available Anime types
  final AnimeType? type;

  /// Filter py score (rate) Anime
  /// "min_score" Set a minimum score for results.
  /// "max_score" Set a maximum  score for results.
  final double? score, minScore, maxScore;

  /// Enum: "g" "pg" "pg13" "r17" "r" "rx"
  /// Available Anime audience ratings
  ///
  /// Ratings:
  ///   - G - All Ages
  ///   - PG - Children
  ///   - PG-13 - Teens 13 or older
  ///   - R - 17+ (violence & profanity)
  ///   - R+ - Mild Nudity
  ///   - Rx - Hentai
  final AnimeRating? rating;

  /// Filter out Adult entries
  final bool _sfw;
  String? get sfw => _sfw ? "true" : "false";

  /// Exclude genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  final String? genres, genresExclude;

  /// Enum: "mal_id" "title" "start_date" "end_date" "episodes" "score" "scored_by" "rank" "popularity" "members" "favorites"
  /// Available Anime order_by properties
  final AnimeOrderBy? orderBy;

  /// Enum: "desc" "asc"
  /// Search query sort direction
  final AnimeSort? sort;

  /// Return entries starting with the given letter
  /// First letter :)
  final String? letter;

  /// Filter by producer(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3
  final String? producers;

  /// Filter by date. Format: YYYY-MM-DD. e.g 2022, 2005-05, 2005-01-01
  final DateTime? startDate, endDate;
  String? get startDateToString =>
      startDate != null
          ? "${startDate!.year}-${startDate!.month.toString().padLeft(2, "0")}-${startDate!.day.toString().padLeft(2, "0")}"
          : null;
  String? get endDateToString =>
      endDate != null
          ? "${endDate!.year}-${endDate!.month.toString().padLeft(2, "0")}-${endDate!.day.toString().padLeft(2, "0")}"
          : null;

  String get getQuery {
    Map<String, String> map = {
      if (unapproved != null) "unapproved": unapproved!,
      if (page != null) "page": "$page",
      if (limit != null) "limit": "$limit",
      if (q != null) "q": q!,
      if (type != null) "type": type!.name,
      if (score != null) "score": "$score",
      if (minScore != null) "min_score": "$minScore",
      if (maxScore != null) "max_score": "$maxScore",
      if (rating != null) "rating": rating!.name,
      if (sfw != null) "sfw": sfw!,
      if (genres != null) "genres": genres!,
      if (genresExclude != null) "genres_exclude": genresExclude!,
      if (orderBy != null) "order_by": orderBy!.name,
      if (sort != null) "sort": sort!.name,
      if (letter != null) "letter": letter!,
      if (producers != null) "producers": producers!,
      if (startDateToString != null) "start_date": startDateToString!,
      if (endDateToString != null) "end_date": endDateToString!,
    };
    return map.entries.map((e) => "${e.key}=${e.value}").join("&");
  }
}

class AnimeIdInitialFatchEvent extends ObjectEvent {
  final int id;
  AnimeIdInitialFatchEvent({required this.id});
}
