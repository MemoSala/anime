class ObjectModel {
  final int malId;
  final String type;
  final String name;
  final String url;

  const ObjectModel({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  ObjectModel.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'],
      type = json['type'],
      name = json['name'],
      url = json['url'];
}
