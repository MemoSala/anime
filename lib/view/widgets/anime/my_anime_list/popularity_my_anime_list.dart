import 'package:flutter/material.dart';

class PopularityMyAnimeList extends StatelessWidget {
  const PopularityMyAnimeList({super.key, required this.popularity});
  final int popularity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "#$popularity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).focusColor,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "الترتيب العالمى",
            style: TextStyle(color: Theme.of(context).focusColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
