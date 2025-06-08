import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/anime_controller.dart';
import '../../../core/class/child_image.dart';
import '../../../data/api/object_bloc.dart';
import '../animes_view.dart';

class RecommendationsAnime extends GetView<AnimeController> {
  const RecommendationsAnime({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeController controller = Get.find();
    return AnimesView<RecommendationsAnimeInitialFatchEvent>(
      onError: controller.getBlocRecommendations,
      onPressed: controller.updateData,
      bloc: controller.objectBlocRecommendations,
      childImage: ChildImage.none,
    );
  }
}
