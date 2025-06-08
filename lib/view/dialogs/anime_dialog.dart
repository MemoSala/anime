import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/consts/routes_app.dart';
import '../../data/models/anime_model.dart';

class AnimeDialog extends StatelessWidget {
  const AnimeDialog({super.key, required this.anime});

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            const BoxShadow(color: Colors.white),
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor.withAlpha(204),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                if (anime.trailer != null)
                  SizedBox(
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            anime.trailer!.images.largeImageUrl!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                          ),
                        ),
                      ),
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "  ${anime.episodes} حلقه",
                        style: const TextStyle(
                          color: Colors.white,
                          inherit: false,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: iconGestureDetector(Icons.check),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: iconGestureDetector(
                        Icons.insert_comment_rounded,
                        sizeIcon: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => Get.toNamed(
                            RoutesApp.anime,
                            arguments: {"anime": anime},
                          ),
                      child: iconGestureDetector(Icons.home_outlined),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ],
            ),
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              child: Text(
                "ما رأيك فى الحلقة؟",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      Theme.of(context).focusColor != Colors.white
                          ? Colors.black
                          : Colors.grey.shade400,
                  inherit: false,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: iconButtonStar("اسطورية", 5),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: iconButtonStar("رائعة", 4),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: iconButtonStar("جيدة", 3),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: iconButtonStar("متوسطة", 2),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: iconButtonStar("سيئة", 1),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  color: Colors.amber,
                ),
                alignment: Alignment.center,
                child: const Text(
                  "المشاهدة والتحميل",
                  style: TextStyle(
                    inherit: false,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container iconGestureDetector(IconData icon, {double sizeIcon = 24}) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: Colors.grey.shade600, size: sizeIcon),
    );
  }

  Column iconButtonStar(String text, int index) {
    return Column(
      children: [
        Icon(Icons.star_rounded, size: 45, color: Colors.grey.shade400),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade400,
            inherit: false,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
