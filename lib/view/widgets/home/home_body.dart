import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/consts/routes_app.dart';
import '../../../data/api/object_bloc.dart';
import '../../../data/models/anime_id_model.dart';
import '../card_anime.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.bloc});

  final ObjectBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObjectBloc, ObjectState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is AnimesInitialFatchEvent,
      buildWhen: (previous, current) => current is! AnimesInitialFatchEvent,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (ObjectFetchingLoadingState):
            return const Center(child: CircularProgressIndicator());
          case const (ObjectFetchingErrorState):
            String error = (state as ObjectFetchingErrorState).error;
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error, color: Colors.red),
                  Text(error, style: TextStyle(color: Colors.red)),
                ],
              ),
            );
          case const (AnimesFetchingSuccessfulState):
            List<AnimeIdModel> animes =
                (state as AnimesFetchingSuccessfulState).animes;
            return GridView(
              padding: const EdgeInsets.all(4),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
                childAspectRatio: 4.74 / 9,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              children: <CardAnime>[
                for (AnimeIdModel anime in animes)
                  CardAnime(
                    anime: anime,
                    text: anime.type,
                    onPressed:
                        () => Get.toNamed(
                          RoutesApp.anime,
                          arguments: {"anime": anime, "animeId": anime.malId},
                        ),
                    childImage: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade600,
                            shadows: [Shadow(blurRadius: 2)],
                            size: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${anime.score}",
                            style: TextStyle(color: Colors.yellow.shade600),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          default:
            return Center();
        }
      },
    );
  }
}
