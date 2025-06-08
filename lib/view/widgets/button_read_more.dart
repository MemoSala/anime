import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonReadMore extends StatelessWidget {
  const ButtonReadMore({super.key, required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: url != null ? () => launchUrl(Uri.parse(url!)) : null,
      color: Theme.of(context).focusColor,
      icon: Icon(Icons.read_more_rounded),
    );
  }
}
