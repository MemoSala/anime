import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/episodes_controller.dart';
import '../../../data/api/object_bloc.dart';
import '../../../data/models/link_model.dart';
import '../object_bloc_consumer.dart';

class LinksAnime<T> extends GetView<EpisodesController> {
  const LinksAnime({
    super.key,
    required this.title,
    required this.bloc,
    required this.onError,
  });
  final String title;
  final ObjectBloc bloc;
  final void Function()? onError;

  @override
  Widget build(BuildContext context) {
    return ObjectBlocConsumer<LinksFetchingSuccessfulState, T>(
      onError: onError,
      bloc: bloc,
      builder: (state) {
        List<LinkModel> links = state.links;
        if (links.isEmpty) SizedBox();
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Wrap(
                  children: [
                    for (LinkModel link in links)
                      SizedBox(
                        height: 25,
                        child: MaterialButton(
                          onPressed: () => launchUrl(Uri.parse(link.url)),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          minWidth: 0,
                          height: 25,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LogoSide(link.name),
                              SizedBox(width: 4),
                              Text(link.name, style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LogoSide extends StatelessWidget {
  const LogoSide(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    switch (name) {
      case "AniDB":
        return Image.asset("assets/icons/AniDB.png", height: 14);
      case "Wikipedia":
        return Image.asset("assets/icons/wikipedia.png", height: 14);
      case "Crunchyroll":
        return Image.asset("assets/icons/crunchyroll.png", height: 14);
      case "Netflix":
        return Image.asset("assets/icons/netflix.png", height: 14);
      default:
        return Icon(Icons.web, size: 14);
    }
  }
}
