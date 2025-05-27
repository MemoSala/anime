import 'package:get/get.dart';

import '../data/api/object_bloc.dart';

class AnimeController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  late final int? animeId;
  @override
  void onInit() {
    animeId = Get.arguments["animeId"];
    if (animeId != null) {
      objectBloc.add(AnimeIdInitialFatchEvent(id: animeId!));
    }
    super.onInit();
  }
}
