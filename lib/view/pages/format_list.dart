// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/format_list_controller.dart';
import '../../data/api/object_bloc.dart';
import '../widgets/drawer_app.dart';
import '../widgets/animes_view.dart';

class FormatList extends StatelessWidget {
  const FormatList({super.key});
  @override
  Widget build(BuildContext context) {
    FormatListController controller = Get.put(FormatListController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("قائمة الأنمى"),
        actions: [
          IconButton(
            onPressed: controller.goToSearch,
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: controller.editBoxList,
            icon: const Icon(Icons.format_list_bulleted),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const DrawerApp(enumDrawer: EnumDrawer.formatListBulleted),
      body: AnimesView<AnimesInitialFatchEvent>(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        onPressed: controller.goToAnime,
      ),
    );
  }
}
