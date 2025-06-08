import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/episodes_controller.dart';
import '../../data/api/object_bloc.dart';
import '../../data/models/episode_model.dart';
import '../widgets/episodes/id_episodes.dart';
import '../widgets/button_read_more.dart';
import '../widgets/episodes/data_episodes.dart';
import '../widgets/episodes/links_anime.dart';
import '../widgets/episodes/title_episodes.dart';
import '../widgets/object_bloc_consumer.dart';

class Episodes extends StatelessWidget {
  const Episodes({super.key});

  @override
  Widget build(BuildContext context) {
    final EpisodesController controller = Get.put(EpisodesController());
    return Scaffold(
      appBar: AppBar(title: Text("الحلقات والبث")),
      body: ObjectBlocConsumer<
        EpisodesFetchingSuccessfulState,
        EpisodesAnimeInitialFatchEvent
      >(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        builder: (state) {
          List<EpisodeModel> episodes = state.episodes;
          if (episodes.isEmpty) return const NoData();
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LinksAnime<StreamingAnimeInitialFatchEvent>(
                  title: "البث:",
                  onError: controller.getBlocStreaming,
                  bloc: controller.objectBlocStreaming,
                ),
                LinksAnime<ExternalAnimeInitialFatchEvent>(
                  title: "المزيد من المعلومات:",
                  onError: controller.getBlocExternal,
                  bloc: controller.objectBlocExternal,
                ),
                Divider(),
                for (EpisodeModel episode in episodes)
                  ListTile(
                    leading: IdEpisode(id: episode.malId),
                    title: TitleEpisode(title: episode.title),
                    titleTextStyle: TextStyle(
                      color: Theme.of(context).focusColor,
                    ),
                    subtitle: DataEpisode(episode: episode),
                    subtitleTextStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    trailing: ButtonReadMore(url: episode.url),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
