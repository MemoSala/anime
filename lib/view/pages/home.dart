import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../widgets/home/drawer_home.dart';
import '../widgets/home/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("احدث انمبات"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.format_list_bulleted),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const DrawerHome(enumDrawer: EnumDrawer.whatshot),
      body: HomeBody(bloc: controller.objectBloc),
    );
  }
}
