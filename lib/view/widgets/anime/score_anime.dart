import 'package:flutter/material.dart';

import 'box_anime.dart';

class ScoreAnime extends StatelessWidget {
  const ScoreAnime({super.key, required this.score});

  final double score;

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
