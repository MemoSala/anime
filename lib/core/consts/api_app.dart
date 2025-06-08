class ApiApp {
  static const String _host = "https://api.jikan.moe/v4";

  static String getAnimeByIdFull(id) => "$_host/anime/$id/full";
  static String getAnimeById(id) => "$_host/anime/$id";
  static String getCharactersAnime(id) => "$_host/anime/$id/characters";
  static String getStaffAnime(id) => "$_host/anime/$id/staff";
  static String getEpisodesAnime(id) => "$_host/anime/$id/episodes";
  static String getNewsAnime(id) => "$_host/anime/$id/news";
  static String getPicturesAnime(id) => "$_host/anime/$id/pictures";
  static String getStatisticsAnime(id) => "$_host/anime/$id/statistics";
  static String getRecommendationsAnime(id) =>
      "$_host/anime/$id/recommendations";
  static String getReviewsAnime(id) => "$_host/anime/$id/reviews";
  static String getRelationsAnime(id) => "$_host/anime/$id/relations";
  static String getExternalAnime(id) => "$_host/anime/$id/external";
  static String getStreamingAnime(id) => "$_host/anime/$id/streaming";
  static String get getAnimes => "$_host/anime";
}

/*
get Anime Full By Id       => /anime/{id}/full                 ✔(بيانات الأنمي كامله) 
get Anime By Id            => /anime/{id}                      ✔(بيانات الأنمي)
get Anime Characters       => /anime/{id}/characters           ✔(شخصيات الأنمي)
get Anime Staff            => /anime/{id}/staff                ✔(فريق العمل)
get Anime Episodes         => /anime/{id}/episodes             ✔(حلقات الأنمي)
get Anime Episode By Id    => /anime/{id}/episodes/{episode}    (حلقة الأنمي)
get Anime News             => /anime/{id}/news                 ✔(أخبار الأنمي)
get Anime Forum            => /anime/{id}/forum                 (منتدى الأنمي)
get Anime Videos           => /anime/{id}/videos                (فيديوهات الأنمي)
get Anime Videos Episodes  => /anime/{id}/videos/episodes       (فيديوهات وحلقات الأنمي)
get Anime Pictures         => /anime/{id}/pictures             ✔(صور الأنمي)
get Anime Statistics       => /anime/{id}/statistics           ✔(إحصائيات الأنمي)
get Anime More Info        => /anime/{id}/moreinfo              (معلومات إضافية عن الأنمي)
get Anime Recommendations  => /anime/{id}/recommendations      ✔(توصيات الأنمي)
get Anime User Updates     => /anime/{id}/userupdates           (تحديثات مستخدمي الأنمي)
get Anime Reviews          => /anime/{id}/reviews              ✔(مراجعات الأنمي)
get Anime Relations        => /anime/{id}/relations            ✔(علاقات الأنمي)
get Anime Themes           => /anime/{id}/themes                (مواضيع الأنمي)
get Anime External         => /anime/{id}/external             ✔(أنمي خارجي)
get Anime Streaming        => /anime/{id}/streaming            ✔(بث الأنمي)
get Anime Search           => /anime                           ✔(بحث عن الأنمى)
*/
