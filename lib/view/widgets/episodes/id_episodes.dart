import 'package:flutter/material.dart';

class IdEpisode extends StatelessWidget {
  const IdEpisode({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(13)),
      ),
      alignment: Alignment.center,
      child: Text(
        id.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).focusColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
