import '../../core/class/anime_rating.dart';
import '../../core/class/anime_status.dart';
import '../../core/class/anime_type.dart';
import 'images_model.dart';
import 'aired_model.dart';
import 'broadcast_model.dart';
import 'object_model.dart';
import 'titles_model.dart';
import 'trailer_model.dart';

class AnimeModel {
  final int malId;
  final String url;
  final List<ImageModel> images;
  final TrailerModel? trailer;
  final bool approved;
  final List<TitlesModel> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List titleSynonyms;
  final AnimeType type;
  final String source;
  final int episodes;
  final AiredModel aired;
  final String duration;
  final double score;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final BroadcastModel? broadcast;
  final List<ObjectModel> producers;
  final List<ObjectModel> licensors;
  final List<ObjectModel> studios;
  final List<ObjectModel> genres;
  final List explicitGenres;
  final List<ObjectModel> themes;
  final List<ObjectModel> demographics;
  final List? relations;
  final Map? theme;
  final List? external;
  final List? streaming;
  late final AnimeStatus status;
  late final AnimeRating rating;

  AnimeModel({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    this.season,
    this.year,
    this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
    required this.relations,
    required this.theme,
    required this.external,
    required this.streaming,
  });

  AnimeModel.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'],
      url = json['url'],
      images =
          json['images'] is Map
              ? (json['images'] as Map).entries
                  .map((e) => ImageModel.fromJson(e.value))
                  .toList()
              : [],
      trailer =
          json['trailer']?["youtube_id"] != null
              ? TrailerModel.fromJson(json['trailer'])
              : null,

      approved = json['approved'] ?? false,
      titles =
          json['titles'] is List
              ? (json['titles'] as List)
                  .map((e) => TitlesModel.fromJson(e))
                  .toList()
              : [],
      title = json['title'] ?? "Error 404",
      titleSynonyms = json['title_synonyms'] ?? [],
      type = types.firstWhere(
        (e) =>
            e.name.replaceAll("_", " ") ==
            (json['type']?.toLowerCase() ?? "no type"),
        orElse: () => AnimeType.tv,
      ),
      source = json['source'] ?? "",
      titleEnglish = json['title_english'],
      titleJapanese = json['title_japanese'],
      episodes = json['episodes']?.toInt() ?? 0,

      aired = AiredModel.fromJson(json['aired'] ?? {}),
      duration = json['duration'] ?? "No duration",
      score = json['score']?.toDouble() ?? 0,
      scoredBy = json['scored_by'] ?? 0,
      rank = json['rank'] ?? 0,
      popularity = json['popularity'] ?? 0,
      members = json['members'] ?? 0,
      favorites = json['favorites'] ?? 0,
      synopsis = json['synopsis'],
      background = json['background'],
      season = json['season'],
      year = json['year'],
      broadcast =
          json['trailer']?["string"] != null
              ? BroadcastModel.fromJson(json['broadcast'])
              : null,
      producers =
          ((json['producers'] ?? []) as List)
              .map((e) => ObjectModel.fromJson(e))
              .toList(),

      licensors =
          ((json['licensors'] ?? []) as List)
              .map((e) => ObjectModel.fromJson(e))
              .toList(),
      studios =
          ((json['studios'] ?? []) as List)
              .map((e) => ObjectModel.fromJson(e))
              .toList(),
      genres =
          ((json['genres'] ?? []) as List)
              .map((e) => ObjectModel.fromJson(e))
              .toList(),
      explicitGenres = json['explicit_genres'] ?? [],
      themes =
          ((json['themes'] ?? []) as List)
              .map((e) => ObjectModel.fromJson(e))
              .toList(),
      demographics =
          ((json['demographics'] ?? []) as List)
              .map((e) => ObjectModel.fromJson(e))
              .toList(),
      relations = json['relations'],
      theme = json['theme'],
      external = json['external'],
      streaming = json['streaming'] {
    String newStatus = json['status'] ?? "none";
    status =
        newStatus.startsWith("Not")
            ? AnimeStatus.airing
            : newStatus.startsWith("Finished")
            ? AnimeStatus.complete
            : newStatus.startsWith("Currently")
            ? AnimeStatus.upcoming
            : AnimeStatus.none;
    String newRating = json['rating'] ?? "none";
    rating =
        newRating.startsWith("G")
            ? AnimeRating.g
            : newRating.startsWith("PG - ")
            ? AnimeRating.pg
            : newRating.startsWith("PG-13")
            ? AnimeRating.pg13
            : newRating.startsWith("R - 17+")
            ? AnimeRating.r17
            : newRating.startsWith("R+")
            ? AnimeRating.r
            : newRating.startsWith("Rx")
            ? AnimeRating.rx
            : AnimeRating.none;
  }

  String get typeToString {
    switch (type) {
      case AnimeType.no_type:
        return "No Type";
      case AnimeType.tv_special:
        return "TV Special";
      case AnimeType.tv ||
          AnimeType.cm ||
          AnimeType.ona ||
          AnimeType.ova ||
          AnimeType.pv:
        return type.name.toUpperCase();
      case AnimeType.movie || AnimeType.special || AnimeType.music:
        return type.name[0].toUpperCase() + type.name.substring(1);
    }
  }

  String get ratingToString {
    switch (rating) {
      case AnimeRating.g || AnimeRating.none:
        return "جميع الأعمار";
      case AnimeRating.pg:
        return "للأطفال";
      case AnimeRating.pg13:
        return "13+";
      case AnimeRating.r17:
        return "17+ (عنف وألفاظ بذيئة)";
      case AnimeRating.r:
        return "عُري خفيف";
      case AnimeRating.rx:
        return "هنتاي";
    }
  }

  String get statusToString {
    switch (status) {
      case AnimeStatus.airing || AnimeStatus.none:
        return "لم يتم بثه بعد";
      case AnimeStatus.complete:
        return "انتهى";
      case AnimeStatus.upcoming:
        return "يبث حاليا";
    }
  }
}
