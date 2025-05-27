import 'package:flutter/material.dart';

class BoxAnime extends StatelessWidget {
  const BoxAnime({
    super.key,
    required this.child,
    this.marginHorizontal = 16,
    this.paddingVertical = 16,
  });

  final Widget child;
  final double marginHorizontal, paddingVertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: marginHorizontal),
      padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: 16),
      child: child,
    );
  }
}
