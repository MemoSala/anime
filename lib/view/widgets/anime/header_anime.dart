import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/function/translator.dart';
import '../../../data/models/anime_model.dart';
import '../image_anime.dart';

class HeaderAnime extends StatelessWidget {
  const HeaderAnime({super.key, required this.anime});

  final AnimeModel anime;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return SizedBox(
      height: anime.trailer != null ? 290 : 210,
      child: Stack(
        children: [
          if (anime.trailer != null)
            Container(
              height: 224,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(anime.trailer!.images.largeImageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                      "https://www.youtube.com/watch?v=${anime.trailer!.youtubeId}",
                    ),
                  );
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        backgroundColor.withAlpha(50),
                        backgroundColor.withAlpha(0),
                        backgroundColor,
                      ],
                    ),
                  ),
                  child: Image.asset("assets/icons/YouTube.png", height: 50),
                ),
              ),
            ),
          Positioned(
            top: 25,
            left: 5,
            child: IconButton(
              onPressed: Get.back,
              color: Theme.of(context).focusColor,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 15,
            child: Row(
              children: [
                ImageAnime(size: 120, imageUrl: anime.images.first.imageUrl),
                SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      width: width - 120,
                      height: 45,
                      child: Text(
                        anime.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "${anime.typeToString}   •   ${anime.episodes}  حلقه",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    Text(
                      "${anime.ratingToString}   •   ${anime.statusToString}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    Text(
                      "${translatorS(anime.season) ?? ""} ${anime.year ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
