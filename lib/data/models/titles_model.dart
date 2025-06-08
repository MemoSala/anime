class TitlesModel {
  final String type;
  final String title;

  TitlesModel({required this.type, required this.title});

  TitlesModel.fromJson(Map<String, dynamic> json)
    : type = json['type'],
      title = json['title'];
}
