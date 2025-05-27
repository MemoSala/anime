import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/anime_controller.dart';
import '../../core/function/translator.dart';
import '../../data/api/object_bloc.dart';
import '../../data/models/anime_id_model.dart';
import '../widgets/anime/box_anime.dart';
import '../widgets/anime/header_anime.dart';
import '../widgets/anime/icon_button_anime.dart';
import '../widgets/anime/text_rich_anime.dart';

class Anime extends StatelessWidget {
  const Anime({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeController controller = Get.put(AnimeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<ObjectBloc, ObjectState>(
        bloc: controller.objectBloc,
        listenWhen: (previous, current) => current is AnimeIdInitialFatchEvent,
        buildWhen: (previous, current) => current is! AnimeIdInitialFatchEvent,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (ObjectFetchingLoadingState):
              return const Center(child: CircularProgressIndicator());
            case const (ObjectFetchingErrorState):
              return Center(child: Icon(Icons.error, color: Colors.red));
            case const (AnimeIdFetchingSuccessfulState):
              AnimeIdModel animeIdModel =
                  (state as AnimeIdFetchingSuccessfulState).anime;
              return AnimeBody(anime: animeIdModel);
            default:
              return Center();
          }
        },
      ),
    );
  }
}

class AnimeBody extends StatelessWidget {
  const AnimeBody({super.key, required this.anime});

  final AnimeIdModel anime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderAnime(anime: anime),
          Row(
            children: [
              const SizedBox(width: 8),
              ScoreAnime(score: anime.score, scoreBy: anime.scoredBy),
              Expanded(
                child: TextButtonAnime(
                  onTap: () {},
                  icon: Icons.play_arrow,
                  title: "المشاهدة والتحميل",
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          BoxAnime(
            paddingVertical: 0,
            child: Row(
              children: <IconButtonAnime>[
                IconButtonAnime(
                  onPressed: () {},
                  title: 'خلفيات',
                  icon: Icons.image,
                ),
                IconButtonAnime(
                  onPressed: () {},
                  title: 'مراجعات',
                  icon: Icons.book_outlined,
                ),
                IconButtonAnime(
                  onPressed: () {},
                  title: 'تعليقات',
                  icon: Icons.comment,
                ),
              ],
            ),
          ),
          BoxAnime(
            paddingVertical: 0,
            child: Row(
              children: <IconButtonAnime>[
                IconButtonAnime(
                  onPressed: () {},
                  title: "اضف تقييمك",
                  icon: Icons.star_border_outlined,
                ),
                IconButtonAnime(
                  onPressed: () {},
                  title: "اضف لقائمتك",
                  icon: Icons.playlist_add_sharp,
                ),
                IconButtonAnime(
                  onPressed: () {},
                  title: 'المفضلة',
                  icon: Icons.favorite_border,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff2e51a2),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/MyAnimeList.jpg",
                  height: 40,
                  width: 120,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                              ),
                              Text(
                                "  ${anime.score}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "(${anime.scoredBy})",
                            style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              "#${anime.popularity}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).focusColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "الترتيب العالمى",
                            style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButtonAnime(
                      onPressed: () {
                        launchUrl(Uri.parse(anime.url));
                      },
                      title: 'المزيد',
                      icon: Icons.read_more_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ),
          BoxAnime(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (anime.synopsis != null) SynopsisAnime(anime.synopsis),
                const SizedBox(height: 25),
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
                          text: snapshot.data?.toLowerCase().replaceAll(
                            "ep",
                            "حلقة",
                          ),
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
                TextRichAnime(
                  title: "العنوان بالأنجليزى",
                  text: anime.titleEnglish,
                ),
                TextRichAnime(
                  title: "العنوان باليبانى",
                  text: anime.titleJapanese,
                ),
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
          ),
        ],
      ),
    );
  }
}

class TagAnime extends StatelessWidget {
  const TagAnime(this.tag, {super.key});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: translator(tag),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BoxTagAnime(snapshot.data!);
        }
        return SizedBox();
      },
    );
  }
}

class BoxTagAnime extends StatelessWidget {
  const BoxTagAnime(this.tag, {super.key});
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "  $tag  ",
        style: TextStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontSize: 10,
        ),
      ),
    );
  }
}

class SynopsisAnime extends StatelessWidget {
  const SynopsisAnime(this.synopsis, {super.key});

  final String? synopsis;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: translator(synopsis),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Theme.of(context).focusColor),
          );
        }
        return SizedBox();
      },
    );
  }
}

class TextButtonAnime extends StatelessWidget {
  const TextButtonAnime({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });
  final void Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        onTap: onTap,
        titleTextStyle: TextStyle(
          color: Theme.of(context).focusColor,
          fontSize: 14,
        ),
        minVerticalPadding: 0,
        horizontalTitleGap: 8,
        tileColor: Theme.of(context).hintColor,
        contentPadding: EdgeInsets.all(16),
        minTileHeight: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        title: Text(title),
        trailing: Icon(icon, color: Theme.of(context).focusColor),
      ),
    );
  }
}

class ScoreAnime extends StatelessWidget {
  const ScoreAnime({super.key, required this.score, required this.scoreBy});

  final double score;
  final int scoreBy;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BoxAnime(
        marginHorizontal: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star_rounded, color: Colors.amber),
                Text(
                  "  $score",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).focusColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
