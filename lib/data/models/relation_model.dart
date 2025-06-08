import 'object_model.dart';

class RelationModel {
  final String relation;
  final List<ObjectModel> entry;

  const RelationModel({required this.relation, required this.entry});

  RelationModel.fromJson(Map<String, dynamic> json)
    : relation = json['relation'],
      entry =
          ((json['entry'] ?? []) as List)
              .map((e) => ObjectModel.fromJson(e))
              .toList();
}
