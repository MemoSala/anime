import 'package:flutter/material.dart';

class TextButtonAnime extends StatelessWidget {
  const TextButtonAnime({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });
  final void Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListTile(
        onTap: onTap,
        titleTextStyle: TextStyle(
          color: Theme.of(context).focusColor,
          fontSize: 14,
        ),
        minVerticalPadding: 0,
        horizontalTitleGap: 8,
        tileColor: Theme.of(context).hintColor,
        contentPadding: EdgeInsets.all(16),
        minTileHeight: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        title: Text(title),
        trailing: Icon(icon, color: Theme.of(context).focusColor),
      ),
    );
  }
}
