import 'package:flutter/material.dart';

class PhotoMyAnimeList extends StatelessWidget {
  const PhotoMyAnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/MyAnimeList.jpg",
      height: 40,
      width: 120,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
    );
  }
}
