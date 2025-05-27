import 'package:get/get.dart';

import '../data/api/object_bloc.dart';

class FormatListController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  @override
  void onInit() {
    objectBloc.add(AnimesInitialFatchEvent());
    super.onInit();
  }
}
