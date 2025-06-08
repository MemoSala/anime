import 'package:get/get.dart';

import '../data/api/object_bloc.dart';

class ImagesController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  late final int id;
  @override
  void onInit() {
    id = Get.arguments["id"];
    getBloc();
    super.onInit();
  }

  void getBloc() => objectBloc.add(ImagesAnimeInitialFatchEvent(id: id));
}

//Statistics
//Reviews
