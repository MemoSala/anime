// ignore_for_file: file_names

class AiredModel {
  final String? from;
  final String? to;
  final String? string;

  const AiredModel({this.from, this.to, this.string});

  AiredModel.fromJson(Map<String, dynamic> json)
    : from = json['from'],
      to = json['to'],
      string = json['string'];
}
