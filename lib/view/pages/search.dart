import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';
import '../../data/api/object_bloc.dart';
import '../widgets/animes_view.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    SearchController controller = Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller.search,
          onEditingComplete: controller.onSearch,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "بحث",
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.onSearch,
            icon: const Icon(Icons.search),
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
