import 'package:get/get.dart';

import '../core/consts/routes_app.dart';
import '../data/api/object_bloc.dart';

class AnimeController extends GetxController {
  final ObjectBloc objectBloc = ObjectBloc();
  final ObjectBloc objectBlocRelations = ObjectBloc();
  final ObjectBloc objectBlocStaff = ObjectBloc();
  final ObjectBloc objectBlocCharacters = ObjectBloc();
  final ObjectBloc objectBlocRecommendations = ObjectBloc();
  final ObjectBloc objectBlocNews = ObjectBloc();

  late int id;
  @override
  void onInit() {
    id = Get.arguments["animeId"];
    _updateData();
    super.onInit();
  }

  @override
  void dispose() {
    objectBloc.close();
    objectBlocRelations.close();
    objectBlocStaff.close();
    objectBlocCharacters.close();
    objectBlocRecommendations.close();
    objectBlocNews.close();
    super.dispose();
  }

  void updateData(int newId) {
    id = newId;
    _updateData();
  }

  void getBloc() => objectBloc.add(AnimeIdInitialFatchEvent(id: id));
  void getBlocRelations() =>
      objectBlocRelations.add(RelationsAnimeInitialFatchEvent(id: id));
  void getBlocStaff() =>
      objectBlocStaff.add(StaffAnimeInitialFatchEvent(id: id));
  void getBlocCharacters() =>
      objectBlocCharacters.add(CharactersAnimeInitialFatchEvent(id: id));
  void getBlocRecommendations() => objectBlocRecommendations.add(
    RecommendationsAnimeInitialFatchEvent(id: id),
  );
  void getBlocNews() => objectBlocNews.add(NewsAnimeInitialFatchEvent(id: id));

  void _updateData() {
    getBloc();
    getBlocNews();
    Future.delayed(Duration(seconds: 2), () {
      getBlocRelations();
      getBlocStaff();
      Future.delayed(Duration(seconds: 2), () {
        getBlocCharacters();
        getBlocRecommendations();
      });
    });
  }

  void goToEpisodes() => Get.toNamed(RoutesApp.episodes, arguments: {"id": id});
  void goToImages() => Get.toNamed(RoutesApp.images, arguments: {"id": id});
  void goToStatistics() =>
      Get.toNamed(RoutesApp.statistics, arguments: {"id": id});
  void goToReviews() => Get.toNamed(RoutesApp.reviews, arguments: {"id": id});
}
