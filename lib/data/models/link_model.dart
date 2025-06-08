class LinkModel {
  final String name;
  final String url;

  const LinkModel({required this.name, required this.url});

  LinkModel.fromJson(Map<String, dynamic> json)
    : name = json["name"],
      url = json["url"];

  Map<String, String> toJson() => {"name": name, "url": url};
}
