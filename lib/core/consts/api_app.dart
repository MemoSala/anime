class ApiApp {
  static const String _host = "https://api.jikan.moe/v4";

  static String getAnimeById(id) => "$_host/anime/$id";
  static String get getAnimes => "$_host/anime";

  // static String get getReviewsAnimes => "$_host/reviews/anime";
}
