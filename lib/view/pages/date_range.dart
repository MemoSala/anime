import 'package:flutter/material.dart';

import '../widgets/date_range/all_date_anime.dart';
import '../widgets/date_range/list_anime_date_range.dart';

class DateRange extends StatelessWidget {
  const DateRange({super.key});
  @override
  Widget build(BuildContext context) {
    const double heightTab = 40;
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("المواسم"),
          bottom: TabBar(
            indicatorColor: Colors.amber,
            labelStyle: const TextStyle(fontSize: 12),
            labelColor: Theme.of(context).focusColor,
            tabs: const [
              Tab(text: 'الموسم السابق', height: heightTab),
              Tab(text: 'الموسم الحالى', height: heightTab),
              Tab(text: 'الموسم القادم', height: heightTab),
              Tab(text: 'جميع المواسم', height: heightTab),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            const SizedBox(width: 10),
          ],
        ),
        body: TabBarView(
          children: [
            ListAnimeDateRange(-1), // الموسم السابق
            ListAnimeDateRange(0), // الموسم الحالى
            ListAnimeDateRange(1), // الموسم القادم
            AllDateAnime(),
          ],
        ),
      ),
    );
  }
}
