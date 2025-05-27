// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/format_list_controller.dart';
import '../widgets/home/drawer_home.dart';
import '../widgets/home/home_body.dart';

class FormatList extends StatelessWidget {
  const FormatList({super.key});
  @override
  Widget build(BuildContext context) {
    FormatListController controller = Get.put(FormatListController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("قائمة الأنمى"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const DrawerHome(enumDrawer: EnumDrawer.formatListBulleted),
      body: HomeBody(bloc: controller.objectBloc),
    );
  }
}
