import 'images_model.dart';

class UserModel {
  final String url;
  final String username;
  final List<ImageModel> images;

  const UserModel({
    required this.url,
    required this.username,
    required this.images,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : url = json['url'],
      username = json['username'],
      images =
          json['images'] is Map
              ? (json['images'] as Map).entries
                  .map((e) => ImageModel.fromJson(e.value))
                  .toList()
              : [];
}
