import 'package:get/get.dart';

import 'core/consts/routes_app.dart';
import 'view/pages/anime.dart';
import 'view/pages/date_range.dart';
import 'view/pages/format_list.dart';
import 'view/pages/home.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: RoutesApp.home, page: () => Home()),
  GetPage(name: RoutesApp.anime, page: () => Anime()),
  GetPage(name: RoutesApp.dateRange, page: () => DateRange()),
  GetPage(name: RoutesApp.formatList, page: () => FormatList()),
];
