import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../core/class/anime_order_by.dart';
import '../../core/class/anime_rating.dart';
import '../../core/class/anime_sort.dart';
import '../../core/class/anime_status.dart';
import '../../core/class/anime_type.dart';
import '../../core/consts/api_app.dart';
import '../models/anime_model.dart';
import '../models/character_model.dart';
import '../models/episode_model.dart';
import '../models/images_model.dart';
import '../models/link_model.dart';
import '../models/news_model.dart';
import '../models/relation_model.dart';
import '../models/review_model.dart';
import '../models/statistics_model.dart';
import '../models/voice_actors_model.dart';

part 'object_event.dart';
part 'object_state.dart';

class ObjectBloc extends Bloc<ObjectEvent, ObjectState> {
  ObjectBloc() : super(ObjectInitial()) {
    on<AnimeIdInitialFatchEvent>(animeIdInitialFatchEvent);
    on<AnimesInitialFatchEvent>(animesInitialFatchEvent);
    on<RecommendationsAnimeInitialFatchEvent>(
      recommendationsAnimeInitialFatchEvent,
    );
    on<CharactersAnimeInitialFatchEvent>(charactersAnimeInitialFatchEvent);
    on<StaffAnimeInitialFatchEvent>(staffAnimeInitialFatchEvent);
    on<EpisodesAnimeInitialFatchEvent>(episodesAnimeInitialFatchEvent);
    on<RelationsAnimeInitialFatchEvent>(relationsAnimeInitialFatchEvent);
    on<ImagesAnimeInitialFatchEvent>(imagesAnimeInitialFatchEvent);
    on<StatisticsAnimeInitialFatchEvent>(statisticsAnimeInitialFatchEvent);
    on<ReviewsAnimeInitialFatchEvent>(reviewsAnimeInitialFatchEvent);
    on<NewsAnimeInitialFatchEvent>(newsAnimeInitialFatchEvent);
    on<StreamingAnimeInitialFatchEvent>(streamingAnimeInitialFatchEvent);
    on<ExternalAnimeInitialFatchEvent>(externalAnimeInitialFatchEvent);
  }
  List _data(data) => (data as List).fold([], (List list, dynamic e) {
    return list.any((oldE) => oldE["mal_id"] == e["mal_id"])
        ? list
        : [...list, e];
  });

  Future<void> _initialFatchEvent(
    Emitter<ObjectState> emit,
    String uri,
    Future<void> Function(dynamic data) onSuccess,
  ) async {
    try {
      emit(ObjectFetchingLoadingState());
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        await onSuccess(
          jsonDecode(utf8.decode(response.bodyBytes))["data"],
        ); //429
      } else if (response.statusCode == 429) {
        emit(ObjectFetchingLimitState());
      } else {
        emit(ObjectFetchingErrorState(error: "Error 404: ${response.body}"));
      }
    } catch (e) {
      emit(ObjectFetchingErrorState(error: "Error Connection: $e"));
    }
  }

  FutureOr<void> animeIdInitialFatchEvent(
    AnimeIdInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getAnimeByIdFull(event.id), (
      data,
    ) async {
      AnimeModel anime = AnimeModel.fromJson(data);
      emit(AnimeIdFetchingSuccessfulState(anime: anime));
    });
  }

  FutureOr<void> animesInitialFatchEvent(
    AnimesInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, "${ApiApp.getAnimes}?${event.getQuery}", (
      data,
    ) async {
      List<AnimeModel> animes =
          _data(data).map((e) => AnimeModel.fromJson(e)).toList();
      emit(AnimesFetchingSuccessfulState(animes: animes));
    });
  }

  FutureOr<void> recommendationsAnimeInitialFatchEvent(
    RecommendationsAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getRecommendationsAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<AnimeModel> animes =
          data.map((e) => AnimeModel.fromJson(e["entry"])).toList();
      emit(AnimesFetchingSuccessfulState(animes: animes));
    });
  }

  FutureOr<void> charactersAnimeInitialFatchEvent(
    CharactersAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getCharactersAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<CharacterModel> characters =
          data.map((e) => CharacterModel.fromJson(e)).toList();
      emit(CharactersFetchingSuccessfulState(characters: characters));
    });
  }

  FutureOr<void> staffAnimeInitialFatchEvent(
    StaffAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getStaffAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<VoiceActorsModel> staff =
          data.map((e) => VoiceActorsModel.fromJson(e)).toList();
      emit(StaffFetchingSuccessfulState(staff: staff));
    });
  }

  FutureOr<void> episodesAnimeInitialFatchEvent(
    EpisodesAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getEpisodesAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<EpisodeModel> episodes =
          data.map((e) => EpisodeModel.fromJson(e)).toList();
      emit(EpisodesFetchingSuccessfulState(episodes: episodes));
    });
  }

  FutureOr<void> relationsAnimeInitialFatchEvent(
    RelationsAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getRelationsAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<RelationModel> relations =
          data.map((e) => RelationModel.fromJson(e)).toList();
      emit(RelationsFetchingSuccessfulState(relations: relations));
    });
  }

  FutureOr<void> imagesAnimeInitialFatchEvent(
    ImagesAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getPicturesAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<ImageModel> images =
          data.map((e) => ImageModel.fromJson(e["jpg"] ?? e["webp"])).toList();
      emit(ImagesFetchingSuccessfulState(images: images));
    });
  }

  FutureOr<void> statisticsAnimeInitialFatchEvent(
    StatisticsAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getStatisticsAnime(event.id), (
      data,
    ) async {
      StatisticsModel statistics = StatisticsModel.fromJson(data);
      emit(StatisticsFetchingSuccessfulState(statistics: statistics));
    });
  }

  FutureOr<void> reviewsAnimeInitialFatchEvent(
    ReviewsAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getReviewsAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<ReviewModel> reviews =
          data.map((e) => ReviewModel.fromJson(e)).toList();
      emit(ReviewsFetchingSuccessfulState(reviews: reviews));
    });
  }

  FutureOr<void> newsAnimeInitialFatchEvent(
    NewsAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getNewsAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<NewsModel> news = data.map((e) => NewsModel.fromJson(e)).toList();
      emit(NewsFetchingSuccessfulState(news: news));
    });
  }

  FutureOr<void> streamingAnimeInitialFatchEvent(
    StreamingAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getStreamingAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<LinkModel> links = data.map((e) => LinkModel.fromJson(e)).toList();
      emit(LinksFetchingSuccessfulState(links: links));
    });
  }

  FutureOr<void> externalAnimeInitialFatchEvent(
    ExternalAnimeInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    await _initialFatchEvent(emit, ApiApp.getExternalAnime(event.id), (
      newData,
    ) async {
      List data = newData as List;
      List<LinkModel> links = data.map((e) => LinkModel.fromJson(e)).toList();
      emit(LinksFetchingSuccessfulState(links: links));
    });
  }
}

/*
  _initialFatchEvent(emit, "", (emit,data) {
  });

*/
