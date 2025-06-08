import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/animes_controller.dart';
import '../../data/api/object_bloc.dart';
import '../widgets/animes_view.dart';

class Animes extends StatelessWidget {
  const Animes({super.key});

  @override
  Widget build(BuildContext context) {
    AnimesController controller = Get.put(AnimesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
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
      body: AnimesView<AnimesInitialFatchEvent>(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        onPressed: controller.goToAnime,
      ),
    );
  }
}
