import 'package:flutter/material.dart';

class ImageAnime extends StatelessWidget {
  const ImageAnime({
    super.key,
    required this.size,
    required this.imageUrl,
    this.child,
  });
  final double size;
  final String? imageUrl;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size * 2 / 3,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image:
            imageUrl != null
                ? DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                )
                : null,
      ),
      child: Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient:
              child != null
                  ? LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black45],
                  )
                  : null,
        ),
        child: child,
      ),
    );
  }
}
