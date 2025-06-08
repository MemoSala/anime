import 'images_model.dart';

class TrailerModel {
  final String youtubeId;
  final String url;
  final String embedUrl;
  final ImageModel images;

  const TrailerModel({
    required this.youtubeId,
    required this.url,
    required this.embedUrl,
    required this.images,
  });

  TrailerModel.fromJson(Map<String, dynamic> json)
    : youtubeId = json['youtube_id'],
      url = json['url'],
      embedUrl = json['embed_url'],
      images = ImageModel.fromJson(json['images']);
}
