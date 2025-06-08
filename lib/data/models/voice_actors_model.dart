import 'images_model.dart';

class VoiceActorsModel {
  final int malId;
  final String url;
  final String name;
  final List<ImageModel> images;
  final String? language;
  final List? positions;

  const VoiceActorsModel({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
    this.language,
    this.positions,
  });

  VoiceActorsModel.fromJson(Map<String, dynamic> json)
    : malId = json['person']['mal_id'],
      url = json['person']['url'],
      name = json['person']['name'],
      images =
          json['person']['images'] is Map
              ? (json['person']['images'] as Map).entries
                  .map((e) => ImageModel.fromJson(e.value))
                  .toList()
              : [],
      language = json['language'],
      positions = json['positions'];
}
