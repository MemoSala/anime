class AnimeIdModel {
  late final int malId;
  late final String url;
  late final List<ImagesModel> images;
  late final TrailerModel? trailer;
  late final bool approved;
  late final List<TitlesModel> titles;
  late final String title;
  late final String? titleEnglish;
  late final String? titleJapanese;
  late final List titleSynonyms;
  late final String type;
  late final String source;
  late final int episodes;
  late final String status;
  late final bool airing;
  late final AiredModel aired;
  late final String duration;
  late final String rating;
  late final double score;
  late final int scoredBy;
  late final int rank;
  late final int popularity;
  late final int members;
  late final int favorites;
  late final String? synopsis;
  late final String? background;
  late final String? season;
  late final int? year;
  late final BroadcastModel? broadcast;
  late final List<ObjectAnimeModel> producers;
  late final List<ObjectAnimeModel> licensors;
  late final List<ObjectAnimeModel> studios;
  late final List<ObjectAnimeModel> genres;
  late final List explicitGenres;
  late final List<ObjectAnimeModel> themes;
  late final List<ObjectAnimeModel> demographics;

  AnimeIdModel({
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
    required this.airing,
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
    required this.themes,
    required this.demographics,
  });

  AnimeIdModel.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    images =
        json['images'] is Map
            ? (json['images'] as Map).entries
                .map((e) => ImagesModel.fromJson(e.value))
                .toList()
            : [];
    trailer =
        json['trailer']["youtube_id"] != null
            ? TrailerModel.fromJson(json['trailer'])
            : null;

    approved = json['approved'];
    titles =
        json['titles'] is List
            ? (json['titles'] as List)
                .map((e) => TitlesModel.fromJson(e))
                .toList()
            : [];
    title = json['title'] ?? "Error 404";
    titleSynonyms = json['title_synonyms'];
    type = json['type'] ?? "No type";
    source = json['source'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];
    episodes = json['episodes']?.toInt() ?? 0;
    status = json['status'] ?? "No status";
    airing = json['airing'] ?? "No airing";
    aired = AiredModel.fromJson(json['aired']);
    duration = json['duration'] ?? "No duration";
    rating = json['rating'] ?? "";
    score = json['score']?.toDouble() ?? 0;
    scoredBy = json['scored_by'] ?? 0;
    rank = json['rank'] ?? 0;
    popularity = json['popularity'] ?? 0;
    members = json['members'] ?? 0;
    favorites = json['favorites'] ?? 0;
    synopsis = json['synopsis'];
    background = json['background'];
    season = json['season'];
    year = json['year'];
    broadcast =
        json['trailer']["string"] != null
            ? BroadcastModel.fromJson(json['broadcast'])
            : null;
    producers =
        (json['producers'] as List)
            .map((e) => ObjectAnimeModel.fromJson(e))
            .toList();

    licensors =
        (json['licensors'] as List)
            .map((e) => ObjectAnimeModel.fromJson(e))
            .toList();
    studios =
        (json['studios'] as List)
            .map((e) => ObjectAnimeModel.fromJson(e))
            .toList();
    genres =
        (json['genres'] as List)
            .map((e) => ObjectAnimeModel.fromJson(e))
            .toList();

    explicitGenres = json['explicit_genres'];
    themes =
        (json['themes'] as List)
            .map((e) => ObjectAnimeModel.fromJson(e))
            .toList();
    demographics =
        (json['demographics'] as List)
            .map((e) => ObjectAnimeModel.fromJson(e))
            .toList();
  }
}

class TrailerModel {
  late final String youtubeId;
  late final String url;
  late final String embedUrl;
  late final ImagesModel images;

  TrailerModel({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  TrailerModel.fromJson(Map<String, dynamic> json) {
    youtubeId = json['youtube_id'];
    url = json['url'];
    embedUrl = json['embed_url'];
    images = ImagesModel.fromJson(json['images']);
  }
}

class ImagesModel {
  late final String imageUrl;
  late final String smallImageUrl;
  late final String? mediumImageUrl;
  late final String largeImageUrl;
  late final String? maximumImageUrl;

  ImagesModel({
    required this.imageUrl,
    required this.smallImageUrl,
    this.mediumImageUrl,
    required this.largeImageUrl,
    this.maximumImageUrl,
  });

  ImagesModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
    maximumImageUrl = json['maximum_image_url'];
  }
}

class TitlesModel {
  late final String type;
  late final String title;

  TitlesModel({required this.type, required this.title});

  TitlesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
  }
}

class AiredModel {
  late final String? from;
  late final String? to;
  late final String? string;

  AiredModel({this.from, this.to, this.string});

  AiredModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    string = json['string'];
  }
}

class BroadcastModel {
  late final String day;
  late final String time;
  late final String timezone;
  late final String string;

  BroadcastModel({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });

  BroadcastModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    time = json['time'];
    timezone = json['timezone'];
    string = json['string'];
  }
}

class ObjectAnimeModel {
  late final int malId;
  late final String type;
  late final String name;
  late final String url;

  ObjectAnimeModel({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  ObjectAnimeModel.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
}
