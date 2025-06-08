import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/anime_controller.dart';
import '../../../core/function/translator.dart';
import '../../../data/api/object_bloc.dart';
import '../../../data/models/voice_actors_model.dart';
import '../object_bloc_consumer.dart';

class StaffAnime extends GetView<AnimeController> {
  const StaffAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return ObjectBlocConsumer<
      StaffFetchingSuccessfulState,
      StaffAnimeInitialFatchEvent
    >(
      onError: controller.getBlocStaff,
      bloc: controller.objectBlocStaff,
      builder: (state) {
        List<VoiceActorsModel> staff = state.staff;
        if (staff.isEmpty) return const NoData();
        double width = MediaQuery.of(context).size.width;
        return GridView(
          padding: const EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: width / 3,
            childAspectRatio: 5 / 7,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          children: [
            for (VoiceActorsModel actor in staff)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: width / 4 - 44,
                    backgroundImage: NetworkImage(actor.images.first.imageUrl),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      actor.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).focusColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FutureBuilder(
                      future: translator(actor.positions?.join(", ")),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.hasData
                              ? snapshot.data!
                              : actor.positions?.join(", ") ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection:
                              snapshot.hasData
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
