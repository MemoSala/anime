import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../core/class/anime/anime_order_by.dart';
import '../../core/class/anime/anime_rating.dart';
import '../../core/class/anime/anime_sort.dart';
import '../../core/class/anime/anime_type.dart';
import '../../core/consts/api_app.dart';
import '../models/anime_id_model.dart';

part 'object_event.dart';
part 'object_state.dart';

class ObjectBloc extends Bloc<ObjectEvent, ObjectState> {
  ObjectBloc() : super(ObjectInitial()) {
    on<AnimeIdInitialFatchEvent>(animeIdInitialFatchEvent);
    on<AnimesInitialFatchEvent>(animesInitialFatchEvent);
  }

  FutureOr<void> animeIdInitialFatchEvent(
    AnimeIdInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    try {
      emit(ObjectFetchingLoadingState());
      final response = await http.get(Uri.parse(ApiApp.getAnimeById(event.id)));
      AnimeIdModel anime = AnimeIdModel.fromJson(
        (jsonDecode(utf8.decode(response.bodyBytes)) as Map)["data"],
      );
      emit(AnimeIdFetchingSuccessfulState(anime: anime));
    } catch (e) {
      emit(ObjectFetchingErrorState(error: "Error: $e"));
    }
  }

  FutureOr<void> animesInitialFatchEvent(
    AnimesInitialFatchEvent event,
    Emitter<ObjectState> emit,
  ) async {
    try {
      emit(ObjectFetchingLoadingState());
      final response = await http.get(
        Uri.parse("${ApiApp.getAnimes}?${event.getQuery}"),
      );
      List<AnimeIdModel> animes =
          ((jsonDecode(utf8.decode(response.bodyBytes)) as Map)["data"] as List)
              .map((e) => AnimeIdModel.fromJson(e))
              .toList();
      emit(AnimesFetchingSuccessfulState(animes: animes));
    } catch (e) {
      emit(ObjectFetchingErrorState(error: "Error: $e"));
    }
  }
}
