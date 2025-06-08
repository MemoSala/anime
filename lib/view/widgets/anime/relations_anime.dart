import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/anime_controller.dart';
import '../../../core/function/translator.dart';
import '../../../data/api/object_bloc.dart';
import '../../../data/models/object_model.dart';
import '../../../data/models/relation_model.dart';
import '../object_bloc_consumer.dart';

class RelationsAnime extends GetView<AnimeController> {
  const RelationsAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return ObjectBlocConsumer<
      RelationsFetchingSuccessfulState,
      RelationsAnimeInitialFatchEvent
    >(
      onError: controller.getBlocRelations,
      bloc: controller.objectBlocRelations,
      builder: (state) {
        List<RelationModel> relations = state.relations;
        if (relations.isEmpty) return NoData();
        AnimeController controller = Get.find();
        return ListView(
          padding: const EdgeInsets.all(4),
          children: [
            for (RelationModel relation in relations)
              for (ObjectModel object in relation.entry)
                ListTile(
                  onTap:
                      object.type == "anime"
                          ? () => controller.updateData(object.malId)
                          : null,
                  title: Text(object.name),
                  titleTextStyle: TextStyle(
                    color: Theme.of(context).focusColor,
                  ),
                  subtitle: FutureBuilder(
                    future: translator(relation.relation),
                    builder:
                        (context, snapshot) => Text(
                          snapshot.hasData
                              ? "${relation.relation} - ${snapshot.data!}"
                              : relation.relation,
                        ),
                  ),
                  subtitleTextStyle: const TextStyle(color: Colors.grey),
                  trailing: Text(
                    object.type,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
          ],
        );
      },
    );
  }
}
