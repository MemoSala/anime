import 'package:flutter/material.dart';

import '../../../../core/function/translator.dart';

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
