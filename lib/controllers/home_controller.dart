import 'package:get/get.dart';

import '../core/class/anime/anime_order_by.dart';
import '../core/class/anime/anime_sort.dart';
import '../data/api/object_bloc.dart';

class HomeController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  @override
  void onInit() {
    objectBloc.add(
      AnimesInitialFatchEvent(
        orderBy: AnimeOrderBy.start_date,
        sort: AnimeSort.desc,
      ),
    );
    super.onInit();
  }
}
