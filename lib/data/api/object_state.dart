part of 'object_bloc.dart';

@immutable
abstract class ObjectState {}

abstract class ObjectActionState extends ObjectState {}

class ObjectInitial extends ObjectState {}

class ObjectFetchingLoadingState extends ObjectState {}

class ObjectFetchingErrorState extends ObjectState {
  final String error;
  ObjectFetchingErrorState({required this.error});
}

class AnimeIdFetchingSuccessfulState extends ObjectState {
  final AnimeIdModel anime;
  AnimeIdFetchingSuccessfulState({required this.anime});
}

class AnimesFetchingSuccessfulState extends ObjectState {
  final List<AnimeIdModel> animes;
  AnimesFetchingSuccessfulState({required this.animes});
}
