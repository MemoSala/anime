import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/anime_controller.dart';
import '../../../core/function/translator.dart';
import '../../../data/api/object_bloc.dart';
import '../../../data/models/news_model.dart';
import '../object_bloc_consumer.dart';

class NewsAnime extends GetView<AnimeController> {
  const NewsAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return ObjectBlocConsumer<
      NewsFetchingSuccessfulState,
      NewsAnimeInitialFatchEvent
    >(
      onError: controller.getBlocNews,
      bloc: controller.objectBlocNews,
      builder: (state) {
        List<NewsModel> news = state.news;
        if (news.isEmpty) return SizedBox();
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 180,
            child: PageView(
              controller: PageController(viewportFraction: 0.85),
              children: [
                for (NewsModel oneNews in news)
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                      future: translator(oneNews.title),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.hasData
                                              ? snapshot.data!
                                              : oneNews.title,
                                          textDirection:
                                              snapshot.hasData
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                        );
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    FutureBuilder(
                                      future: translator(oneNews.excerpt),
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.hasData
                                              ? snapshot.data!
                                              : oneNews.excerpt,
                                          textDirection:
                                              snapshot.hasData
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                          style: TextStyle(fontSize: 10),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              if (oneNews.image != null) SizedBox(width: 8),
                              if (oneNews.image != null)
                                Image.network(
                                  oneNews.image!.imageUrl,
                                  height: 100,
                                ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            ButtonNews(
                              icon: Icons.comment,
                              text: "${oneNews.comments}",
                              onPressed: null,
                            ),
                            ButtonNews(
                              icon: Icons.person,
                              text: "المؤلف",
                              onPressed:
                                  () => launchUrl(Uri.parse(oneNews.authorUrl)),
                            ),
                            ButtonNews(
                              icon: Icons.forum,
                              text: "المنتدى",
                              onPressed:
                                  () => launchUrl(Uri.parse(oneNews.forumUrl)),
                            ),
                            ButtonNews(
                              icon: Icons.read_more_rounded,
                              text: "المزيد من التفاصيل",
                              onPressed:
                                  () => launchUrl(Uri.parse(oneNews.url)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonNews extends StatelessWidget {
  const ButtonNews({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  final IconData icon;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
        minWidth: 0,
        height: 0,
        child: Row(
          children: [
            Icon(icon, size: 14),
            SizedBox(width: 2),
            Text(text, style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
