import 'package:get/get.dart';

import '../core/class/anime_order_by.dart';
import '../core/class/anime_sort.dart';
import '../core/consts/routes_app.dart';
import '../data/api/object_bloc.dart';

class DateRangeController extends GetxController {
  final ObjectBloc objectBlocOld = ObjectBloc();
  final ObjectBloc objectBlocNow = ObjectBloc();
  final ObjectBloc objectBlocFuture = ObjectBloc();

  @override
  void onInit() {
    objectBlocOld.add(_animesInitial(-1));
    objectBlocNow.add(_animesInitial(0));
    objectBlocFuture.add(_animesInitial(1));
    super.onInit();
  }

  void getBlocOld() => objectBlocOld.add(_animesInitial(-1));
  void getBlocNow() => objectBlocNow.add(_animesInitial(0));
  void getBlocFuture() => objectBlocFuture.add(_animesInitial(1));

  AnimesInitialFatchEvent _animesInitial(int index) {
    DateTime now = DateTime.now();
    return AnimesInitialFatchEvent(
      orderBy: AnimeOrderBy.start_date,
      startDate: DateTime(now.year, 1 + now.month + 3 * index, 1),
    );
  }

  @override
  void dispose() {
    objectBlocOld.close();
    objectBlocNow.close();
    objectBlocFuture.close();
    super.dispose();
  }

  void goToSearch() {
    Get.toNamed(RoutesApp.search);
  }

  void editBoxList() {}
  void goToAnime(int id) =>
      Get.toNamed(RoutesApp.anime, arguments: {"animeId": id});
  void goToSeason(int i, int year, String title) => Get.toNamed(
    RoutesApp.animes,
    arguments: {
      "event": AnimesInitialFatchEvent(
        orderBy: AnimeOrderBy.start_date,
        sort: AnimeSort.asc,
        startDate: DateTime(year, 1 + (i * 3)),
      ),
      "title": "$title $year",
    },
  );
}
