import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/episode_model.dart';

class DataEpisode extends StatelessWidget {
  const DataEpisode({super.key, required this.episode});

  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${episode.titleRomanji} (${episode.titleJapanese})",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            "${DateFormat('E - yyyy MMM d').format(episode.aired)}   ( ${episode.score} ⭐ )",
          ),
        ),
      ],
    );
  }
}
