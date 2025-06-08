import 'package:get/get.dart';

import '../data/api/object_bloc.dart';

class EpisodesController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  final ObjectBloc objectBlocExternal = ObjectBloc();
  final ObjectBloc objectBlocStreaming = ObjectBloc();
  late final int id;
  @override
  void onInit() {
    id = Get.arguments["id"];
    getBloc();
    getBlocExternal();
    getBlocStreaming();
    super.onInit();
  }

  void getBloc() => objectBloc.add(EpisodesAnimeInitialFatchEvent(id: id));
  void getBlocExternal() =>
      objectBlocExternal.add(ExternalAnimeInitialFatchEvent(id: id));
  void getBlocStreaming() =>
      objectBlocStreaming.add(StreamingAnimeInitialFatchEvent(id: id));
}
