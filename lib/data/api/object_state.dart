part of 'object_bloc.dart';

@immutable
abstract class ObjectState {}

abstract class ObjectActionState extends ObjectState {}

class ObjectInitial extends ObjectState {}

class ObjectFetchingLoadingState extends ObjectState {}

class ObjectFetchingLimitState extends ObjectState {}

class ObjectFetchingErrorState extends ObjectState {
  final String error;
  ObjectFetchingErrorState({required this.error});
}

class AnimeIdFetchingSuccessfulState extends ObjectState {
  final AnimeModel anime;
  AnimeIdFetchingSuccessfulState({required this.anime});
}

class AnimesFetchingSuccessfulState extends ObjectState {
  final List<AnimeModel> animes;
  AnimesFetchingSuccessfulState({required this.animes});
}

class CharactersFetchingSuccessfulState extends ObjectState {
  final List<CharacterModel> characters;
  CharactersFetchingSuccessfulState({required this.characters});
}

class StaffFetchingSuccessfulState extends ObjectState {
  final List<VoiceActorsModel> staff;
  StaffFetchingSuccessfulState({required this.staff});
}

class EpisodesFetchingSuccessfulState extends ObjectState {
  final List<EpisodeModel> episodes;
  EpisodesFetchingSuccessfulState({required this.episodes});
}

class RelationsFetchingSuccessfulState extends ObjectState {
  final List<RelationModel> relations;
  RelationsFetchingSuccessfulState({required this.relations});
}

class ImagesFetchingSuccessfulState extends ObjectState {
  final List<ImageModel> images;
  ImagesFetchingSuccessfulState({required this.images});
}

class StatisticsFetchingSuccessfulState extends ObjectState {
  final StatisticsModel statistics;
  StatisticsFetchingSuccessfulState({required this.statistics});
}

class ReviewsFetchingSuccessfulState extends ObjectState {
  final List<ReviewModel> reviews;
  ReviewsFetchingSuccessfulState({required this.reviews});
}

class NewsFetchingSuccessfulState extends ObjectState {
  final List<NewsModel> news;
  NewsFetchingSuccessfulState({required this.news});
}

class LinksFetchingSuccessfulState extends ObjectState {
  final List<LinkModel> links;
  LinksFetchingSuccessfulState({required this.links});
}
