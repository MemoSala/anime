import 'package:get/get.dart';

import '../core/class/anime_order_by.dart';
import '../core/class/anime_sort.dart';
import '../core/consts/routes_app.dart';
import '../data/api/object_bloc.dart';

class HomeController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
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
    AnimesInitialFatchEvent(
      orderBy: AnimeOrderBy.start_date,
      sort: AnimeSort.desc,
      minScore: 0.01,
    ),
  );

  void goToSearch() {
    Get.toNamed(RoutesApp.search);
  }

  void editBoxList() {}
  void goToAnime(int id) {
    Get.toNamed(RoutesApp.anime, arguments: {"animeId": id});
  }
}
