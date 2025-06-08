import 'package:flutter/material.dart';

import '../../../core/function/translator.dart';
import '../../../data/models/anime_model.dart';
import 'box_anime.dart';
import 'inf_anime/synopsis_anime.dart';
import 'inf_anime/tag_anime.dart';
import 'inf_anime/text_rich_anime.dart';

class InfAnime extends StatelessWidget {
  const InfAnime({super.key, required this.anime});

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    return BoxAnime(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (anime.synopsis != null) SynopsisAnime(anime.synopsis),
          if (anime.synopsis != null) const SizedBox(height: 25),
          Wrap(
            textDirection: TextDirection.rtl,
            children: [
              ...anime.genres.map((tag) {
                return TagAnime(tag.name);
              }),
              ...anime.themes.map((theme) {
                return TagAnime(theme.name);
              }),
              ...anime.demographics.map((demographic) {
                return TagAnime(demographic.name);
              }),
            ],
          ),
          const SizedBox(height: 8),
          if (anime.duration != "Unknown")
            FutureBuilder(
              future: translator(anime.duration),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TextRichAnime(
                    title: "مدة الحلقه",
                    text: snapshot.data?.toLowerCase().replaceAll("ep", "حلقة"),
                  );
                }
                return SizedBox();
              },
            ),
          Row(
            children: [
              Expanded(
                child: TextRichAnime(
                  title: "إلى",
                  text: anime.aired.to?.replaceRange(
                    10,
                    anime.aired.from!.length,
                    "",
                  ),
                ),
              ),
              Expanded(
                child: TextRichAnime(
                  title: "عرض من",
                  text: anime.aired.from?.replaceRange(
                    10,
                    anime.aired.from!.length,
                    "",
                  ),
                ),
              ),
            ],
          ),
          TextRichAnime(title: "العنوان بالأنجليزى", text: anime.titleEnglish),
          TextRichAnime(title: "العنوان باليبانى", text: anime.titleJapanese),
          if (anime.studios.isNotEmpty)
            Wrap(
              textDirection: TextDirection.rtl,
              children: [
                //
                Text(
                  " : الاستوديو",
                  style: TextStyle(color: Theme.of(context).focusColor),
                ),
                ...anime.studios.map((studio) {
                  return BoxTagAnime(studio.name);
                }),
              ],
            ),
          if (anime.producers.isNotEmpty)
            Wrap(
              textDirection: TextDirection.rtl,
              children: [
                //
                Text(
                  " : المنتجين",
                  style: TextStyle(color: Theme.of(context).focusColor),
                ),
                ...anime.producers.map((producer) {
                  return BoxTagAnime(producer.name);
                }),
              ],
            ),
        ],
      ),
    );
  }
}
