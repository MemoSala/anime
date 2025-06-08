// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../core/class/child_image.dart';
import '../../data/models/anime_model.dart';
import 'image_anime.dart';

class CardAnime extends StatelessWidget {
  const CardAnime({
    super.key,
    required this.anime,
    required this.onPressed,
    this.text,
    this.childImage = ChildImage.none,
  });
  final AnimeModel anime;
  final String? text;
  final ChildImage childImage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageAnime(
            size: width / 2 - 8,
            imageUrl: anime.images.first.imageUrl,
            child: _childImage,
          ),
          TextCardAnime(
            anime.title,
            style: TextStyle(color: Theme.of(context).focusColor),
          ),
          if (text != null)
            TextCardAnime(
              text!,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          if (text == null) SizedBox(height: 5),
          SizedBox(),
        ],
      ),
    );
  }

  Widget? get _childImage {
    switch (childImage) {
      case ChildImage.episodes:
        return Container(
          height: 20,
          constraints: BoxConstraints(minWidth: 50),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.yellow.shade600,
          ),
          child: Text(
            "${anime.episodes} حلقه",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        );
      case ChildImage.score:
        return Padding(
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
        );
      case ChildImage.none:
        return null;
    }
  }
}

class TextCardAnime extends StatelessWidget {
  const TextCardAnime(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
