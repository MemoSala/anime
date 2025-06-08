import 'package:flutter/material.dart';

import '../../../../core/function/translator.dart';

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
