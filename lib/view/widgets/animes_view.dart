import 'package:flutter/material.dart';

import '../../core/class/child_image.dart';
import '../../data/api/object_bloc.dart';
import '../../data/models/anime_model.dart';
import 'card_anime.dart';
import 'object_bloc_consumer.dart';

class AnimesView<T> extends StatelessWidget {
  const AnimesView({
    super.key,
    required this.bloc,
    this.childImage,
    required this.onPressed,
    required this.onError,
  });

  final ObjectBloc bloc;
  final ChildImage? childImage;
  final void Function(int id) onPressed;
  final void Function()? onError;

  @override
  Widget build(BuildContext context) {
    return ObjectBlocConsumer<AnimesFetchingSuccessfulState, T>(
      onError: onError,
      bloc: bloc,
      builder: (state) {
        List<AnimeModel> animes = state.animes;
        if (animes.isEmpty) return NoData();
        return GridView(
          padding: const EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
            childAspectRatio: (childImage != null ? 5 : 4.74) / 9,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          children: <CardAnime>[
            for (AnimeModel anime in animes)
              CardAnime(
                anime: anime,
                text: childImage != null ? null : anime.typeToString,
                onPressed: () => onPressed(anime.malId),
                childImage: childImage ?? ChildImage.score,
              ),
          ],
        );
      },
    );
  }
}
