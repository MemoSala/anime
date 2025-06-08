import 'package:flutter/material.dart';

class ScoreMyAnimeList extends StatelessWidget {
  const ScoreMyAnimeList({
    super.key,
    required this.score,
    required this.scoredBy,
  });
  final double score;
  final int scoredBy;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: 5),
          Text(
            "($scoredBy)",
            style: TextStyle(color: Theme.of(context).focusColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
