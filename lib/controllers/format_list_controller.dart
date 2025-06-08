import 'package:get/get.dart';

import '../core/consts/routes_app.dart';
import '../data/api/object_bloc.dart';

class FormatListController extends GetxController {
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

  void getBloc() => objectBloc.add(AnimesInitialFatchEvent());

  void goToSearch() {
    Get.toNamed(RoutesApp.search);
  }

  void editBoxList() {}
  void goToAnime(int id) {
    Get.toNamed(RoutesApp.anime, arguments: {"animeId": id});
  }
}
