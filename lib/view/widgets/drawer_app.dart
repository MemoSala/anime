import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/anime_order_by.dart';
import '../../core/consts/routes_app.dart';
import '../../data/api/object_bloc.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key, required this.enumDrawer});
  final EnumDrawer enumDrawer;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        ButtonDrawer(
          onTap: () => Get.offNamed(RoutesApp.home),
          text: "احدث انمبات",
          icon: Icons.whatshot,
          isPage: enumDrawer == EnumDrawer.whatshot,
        ),
        ButtonDrawer(
          onTap: () => Get.offNamed(RoutesApp.formatList),
          text: "قائمة الأنمى",
          icon: Icons.format_list_bulleted,
          isPage: enumDrawer == EnumDrawer.formatListBulleted,
        ),
        ButtonDrawer(
          onTap: () {
            Get.back();
            Get.toNamed(RoutesApp.dateRange);
          },
          text: "المواسم",
          icon: Icons.date_range,
          isPage: enumDrawer == EnumDrawer.dateRange,
        ),
        ButtonDrawer(
          onTap: () async {
            Get.back();
            Get.toNamed(
              RoutesApp.animes,
              arguments: {
                "event": AnimesInitialFatchEvent(
                  orderBy: AnimeOrderBy.popularity,
                ),
                "title": "التقيم العالمى",
              },
            );
          },
          text: "الترتيب العالمى",
          icon: Icons.bar_chart,
          isPage: enumDrawer == EnumDrawer.barChart,
        ),
        ButtonDrawer(
          onTap: () {
            Get.back();
            Get.toNamed(
              RoutesApp.animes,
              arguments: {
                "event": AnimesInitialFatchEvent(
                  orderBy: AnimeOrderBy.start_date,
                  startDate: DateTime.now(),
                ),
                "title": "قادم قريباً",
              },
            );
          },
          text: "قادم قريباً",
          icon: Icons.upcoming,
          isPage: enumDrawer == EnumDrawer.upcoming,
        ),
        /*Divider(color: Theme.of(context).focusColor),
        ButtonDrawer(
          onTap: () {},
          text: "قائنتى",
          icon: Icons.view_list,
          isPage: enumDrawer == EnumDrawer.viewList,
        ),
        ButtonDrawer(
          onTap: () {},
          text: "انمياتى المفضلة",
          icon: Icons.favorite,
          isPage: enumDrawer == EnumDrawer.favorite1,
        ),
        ButtonDrawer(
          onTap: () {},
          text: "شخصيلتى المفضلة",
          icon: Icons.favorite,
          isPage: enumDrawer == EnumDrawer.favorite2,
        ),
        ButtonDrawer(
          onTap: () {},
          text: "أخر المشاهدات",
          icon: Icons.history,
          isPage: enumDrawer == EnumDrawer.history,
        ),
        Divider(color: Theme.of(context).focusColor),
        ButtonDrawer(
          onTap: () {},
          text: "الشخصيات",
          icon: Icons.person,
          isPage: enumDrawer == EnumDrawer.person,
        ),
        ButtonDrawer(
          onTap: () {},
          text: "جدول الحلقات",
          icon: Icons.access_time,
          isPage: enumDrawer == EnumDrawer.accessTime,
        ),
        ButtonDrawer(
          onTap: () {},
          text: "الأخبار",
          icon: Icons.newspaper,
          isPage: enumDrawer == EnumDrawer.newspaper,
        ),
        Divider(color: Theme.of(context).focusColor),
        ButtonDrawer(
          onTap: () {},
          text: "الأعدادات",
          icon: Icons.settings,
          isPage: enumDrawer == EnumDrawer.settings,
        ),*/
      ],
    );
  }
}

class ButtonDrawer extends StatelessWidget {
  const ButtonDrawer({
    super.key,
    required this.icon,
    required this.text,
    required this.isPage,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final bool isPage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        color: isPage ? Colors.amber : null,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 15),
              child: Icon(icon, color: Theme.of(context).focusColor),
            ),
            Text(text, style: TextStyle(color: Theme.of(context).focusColor)),
          ],
        ),
      ),
    );
  }
}

enum EnumDrawer {
  whatshot,
  formatListBulleted,
  dateRange,
  barChart,
  upcoming,
  viewList,
  favorite1,
  favorite2,
  history,
  person,
  accessTime,
  newspaper,
  settings,
}
