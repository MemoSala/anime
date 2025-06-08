import 'package:flutter/material.dart';

class TitleEpisode extends StatelessWidget {
  const TitleEpisode({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, maxLines: 1, overflow: TextOverflow.ellipsis);
  }
}
