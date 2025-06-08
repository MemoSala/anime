import 'images_model.dart';
import 'voice_actors_model.dart';

class CharacterModel {
  final int malId;
  final String url;
  final List<ImageModel> images;
  final String name;
  final String role;
  final int favorites;
  final List<VoiceActorsModel> voiceActors;

  const CharacterModel({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    required this.role,
    required this.favorites,
    required this.voiceActors,
  });

  CharacterModel.fromJson(Map<String, dynamic> json)
    : malId = json['character']['mal_id'],
      url = json['character']['url'],
      images =
          json['character']['images'] is Map
              ? (json['character']['images'] as Map).entries
                  .map((e) => ImageModel.fromJson(e.value))
                  .toList()
              : [],
      name = json['character']['name'] ?? "Error 404",
      role = json['role'] ?? "No role",
      favorites = json['favorites'] ?? 0,
      voiceActors =
          ((json['voice_actors'] ?? []) as List)
              .map((e) => VoiceActorsModel.fromJson(e))
              .toList();
}
