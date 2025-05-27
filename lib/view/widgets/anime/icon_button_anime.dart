import 'package:flutter/material.dart';

class IconButtonAnime extends StatelessWidget {
  const IconButtonAnime({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).focusColor),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).focusColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
