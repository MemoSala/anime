import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/anime_order_by.dart';
import '../core/class/anime_sort.dart';
import '../core/consts/routes_app.dart';
import '../data/api/object_bloc.dart';

class SearchController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  final TextEditingController search = TextEditingController();
  @override
  void onInit() {
    getBloc();
    super.onInit();
  }

  @override
  void dispose() {
    objectBloc.close();
    super.dispose();
  }

  void getBloc() => objectBloc.add(
    AnimesInitialFatchEvent(orderBy: AnimeOrderBy.score, sort: AnimeSort.desc),
  );

  void onSearch() {
    objectBloc.add(
      AnimesInitialFatchEvent(
        orderBy: AnimeOrderBy.score,
        sort: AnimeSort.desc,
        q: search.text,
      ),
    );
  }

  void goToAnime(int id) {
    Get.toNamed(RoutesApp.anime, arguments: {"animeId": id});
  }
}
