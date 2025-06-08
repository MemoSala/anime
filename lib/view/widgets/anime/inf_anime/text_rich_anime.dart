import 'package:flutter/material.dart';

class TextRichAnime extends StatelessWidget {
  const TextRichAnime({super.key, required this.title, required this.text});
  final String title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return text != null
        ? Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$title :   ",
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
              TextSpan(
                text: text ?? "",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          textDirection: TextDirection.rtl,
        )
        : SizedBox();
  }
}
