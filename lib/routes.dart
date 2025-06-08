import 'package:get/get.dart';

import 'core/consts/routes_app.dart';
import 'view/pages/anime.dart';
import 'view/pages/date_range.dart';
import 'view/pages/episodes.dart';
import 'view/pages/format_list.dart';
import 'view/pages/home.dart';
import 'view/pages/images.dart';
import 'view/pages/reviews.dart';
import 'view/pages/animes.dart';
import 'view/pages/search.dart';
import 'view/pages/statistics.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: RoutesApp.home, page: () => Home()),
  GetPage(name: RoutesApp.anime, page: () => Anime()),
  GetPage(name: RoutesApp.dateRange, page: () => DateRange()),
  GetPage(name: RoutesApp.formatList, page: () => FormatList()),
  GetPage(name: RoutesApp.episodes, page: () => Episodes()),
  GetPage(name: RoutesApp.images, page: () => Images()),
  GetPage(name: RoutesApp.statistics, page: () => Statistics()),
  GetPage(name: RoutesApp.reviews, page: () => Reviews()),
  GetPage(name: RoutesApp.animes, page: () => Animes()),
  GetPage(name: RoutesApp.search, page: () => Search()),
];
