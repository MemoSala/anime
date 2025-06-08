import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/anime_controller.dart';
import '../../data/api/object_bloc.dart';
import '../widgets/anime/box_anime.dart';
import '../widgets/anime/characters_anime.dart';
import '../widgets/anime/header_anime.dart';
import '../widgets/anime/icon_button_anime.dart';
import '../widgets/anime/inf_anime.dart';
import '../widgets/anime/my_anime_list/photo_my_anime_list.dart';
import '../widgets/anime/my_anime_list/popularity_my_anime_list.dart';
import '../widgets/anime/my_anime_list/score_my_anime_list.dart';
import '../widgets/anime/news_anime.dart';
import '../widgets/anime/recommendations_anime.dart';
import '../widgets/anime/relations_anime.dart';
import '../widgets/anime/score_anime.dart';
import '../widgets/anime/staff_anime.dart';
import '../widgets/anime/text_button_anime.dart';
import '../widgets/object_bloc_consumer.dart';

class Anime extends StatelessWidget {
  const Anime({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeController controller = Get.put(AnimeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ObjectBlocConsumer<
        AnimeIdFetchingSuccessfulState,
        AnimeIdInitialFatchEvent
      >(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        builder: (state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                //--------------  Header --------------------------------------
                HeaderAnime(anime: state.anime),
                //--------------  Score & Loading Button ----------------------
                Row(
                  children: [
                    const SizedBox(width: 8),
                    ScoreAnime(score: state.anime.score),
                    Expanded(
                      child: TextButtonAnime(
                        onTap: controller.goToEpisodes,
                        icon: Icons.play_arrow,
                        title: "الحلقات والبث",
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                //-------------- Comments Buttons -----------------------------
                BoxAnime(
                  paddingVertical: 0,
                  child: Row(
                    children: <IconButtonAnime>[
                      IconButtonAnime(
                        onPressed: controller.goToImages,
                        title: 'خلفيات',
                        icon: Icons.image,
                      ),
                      IconButtonAnime(
                        onPressed: controller.goToReviews,
                        title: 'مراجعات',
                        icon: Icons.book_outlined,
                      ),
                      IconButtonAnime(
                        onPressed: controller.goToStatistics,
                        title: 'إحصائيات',
                        icon: Icons.stacked_bar_chart,
                      ),
                      /*IconButtonAnime(
                        onPressed: () {},
                        title: 'تعليقات',
                        icon: Icons.comment,
                      ),*/
                    ],
                  ),
                ),
                //-------------- like Buttons ---------------------------------
                /*BoxAnime(
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
                ),*/
                //-------------- MyAnimeList ----------------------------------
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
                      PhotoMyAnimeList(),
                      Row(
                        children: [
                          ScoreMyAnimeList(
                            score: state.anime.score,
                            scoredBy: state.anime.scoredBy,
                          ),
                          PopularityMyAnimeList(
                            popularity: state.anime.popularity,
                          ),
                          IconButtonAnime(
                            onPressed: () {
                              launchUrl(Uri.parse(state.anime.url));
                            },
                            title: 'المزيد',
                            icon: Icons.read_more_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //-------------- inf Anime ------------------------------------
                InfAnime(anime: state.anime),
                //-------------- News Anime -----------------------------------
                NewsAnime(),
                //-------------- Other ----------------------------------------
                SizedBox(height: 8),
                SizedBox(
                  height: 440,
                  width: MediaQuery.sizeOf(context).width,
                  child: DefaultTabController(
                    length: 4,
                    initialIndex: 1,
                    child: Scaffold(
                      appBar: AppBar(
                        leading: SizedBox(),
                        toolbarHeight: 20,
                        flexibleSpace: TabBar(
                          dividerHeight: 0,
                          indicatorColor: Colors.amber,
                          labelStyle: const TextStyle(fontSize: 12),
                          labelColor: Theme.of(context).focusColor,
                          tabs: const [
                            Tab(text: 'أنميات مشابهة'),
                            Tab(text: 'ذات صلة'),
                            Tab(text: 'طاقم عمل'),
                            Tab(text: 'الشخصيات'),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          RecommendationsAnime(),
                          RelationsAnime(),
                          StaffAnime(),
                          CharactersAnime(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
