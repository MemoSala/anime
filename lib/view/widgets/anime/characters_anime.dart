import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/anime_controller.dart';
import '../../../data/api/object_bloc.dart';
import '../../../data/models/character_model.dart';
import '../card_anime.dart';
import '../image_anime.dart';
import '../object_bloc_consumer.dart';

class CharactersAnime extends GetView<AnimeController> {
  const CharactersAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return ObjectBlocConsumer<
      CharactersFetchingSuccessfulState,
      CharactersAnimeInitialFatchEvent
    >(
      onError: controller.getBlocCharacters,
      bloc: controller.objectBlocCharacters,
      builder: (state) {
        List<CharacterModel> characters = state.characters;
        if (characters.isEmpty) return const NoData();
        characters.sort((a, b) => b.favorites.compareTo(a.favorites));
        double width = MediaQuery.of(context).size.width;
        return GridView(
          padding: const EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: width / 3,
            childAspectRatio: 5 / 9,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          children: [
            for (CharacterModel character in characters)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageAnime(
                    size: width / 2 - 8,
                    imageUrl: character.images.first.imageUrl,
                    child: TextCardAnime(
                      "${character.favorites} ❤",
                      style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  TextCardAnime(
                    character.name,
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
