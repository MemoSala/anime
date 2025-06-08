import 'package:get/get.dart';

import '../core/consts/routes_app.dart';
import '../data/api/object_bloc.dart';

class AnimesController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  late AnimesInitialFatchEvent event;
  late String title;
  @override
  void onInit() {
    event = Get.arguments["event"];
    title = Get.arguments["title"];
    getBloc();
    super.onInit();
  }

  @override
  void dispose() {
    objectBloc.close();
    super.dispose();
  }

  void getBloc() => objectBloc.add(event);

  void goToSearch() {
    Get.toNamed(RoutesApp.search);
  }

  void editBoxList() {}
  void goToAnime(int id) {
    Get.toNamed(RoutesApp.anime, arguments: {"animeId": id});
  }
}
