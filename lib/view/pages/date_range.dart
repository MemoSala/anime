import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/date_range_controller.dart';
import '../../data/api/object_bloc.dart';
import '../widgets/animes_view.dart';
import '../widgets/date_range/all_date_anime.dart';

class DateRange extends StatelessWidget {
  const DateRange({super.key});
  @override
  Widget build(BuildContext context) {
    DateRangeController controller = Get.put(DateRangeController());
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("المواسم"),
          bottom: TabBar(
            dividerHeight: 0,
            indicatorColor: Colors.amber,
            labelStyle: const TextStyle(fontSize: 12),
            labelColor: Theme.of(context).focusColor,
            tabs: const [
              Tab(text: 'الموسم السابق', height: 40),
              Tab(text: 'الموسم الحالى', height: 40),
              Tab(text: 'الموسم القادم', height: 40),
              Tab(text: 'جميع المواسم', height: 40),
            ],
          ),
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
        body: TabBarView(
          children: [
            AnimesView<AnimesInitialFatchEvent>(
              onError: controller.getBlocOld,
              bloc: controller.objectBlocOld,
              onPressed: controller.goToAnime,
            ), // الموسم السابق
            AnimesView<AnimesInitialFatchEvent>(
              onError: controller.getBlocNow,
              bloc: controller.objectBlocNow,
              onPressed: controller.goToAnime,
            ), // الموسم الحالى
            AnimesView<AnimesInitialFatchEvent>(
              onError: controller.getBlocFuture,
              bloc: controller.objectBlocFuture,
              onPressed: controller.goToAnime,
            ), // الموسم القادم
            AllDateAnime(),
          ],
        ),
      ),
    );
  }
}
