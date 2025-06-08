import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../data/api/object_bloc.dart';
import '../widgets/drawer_app.dart';
import '../widgets/animes_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("احدث الانمبيات"),
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
      drawer: const DrawerApp(enumDrawer: EnumDrawer.whatshot),
      body: AnimesView<AnimesInitialFatchEvent>(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        onPressed: controller.goToAnime,
      ),
    );
  }
}
