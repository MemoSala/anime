class ReactionsModel {
  final int overall;
  final int nice;
  final int loveIt;
  final int funny;
  final int confusing;
  final int informative;
  final int wellWritten;
  final int creative;

  const ReactionsModel({
    required this.overall,
    required this.nice,
    required this.loveIt,
    required this.funny,
    required this.confusing,
    required this.informative,
    required this.wellWritten,
    required this.creative,
  });

  ReactionsModel.fromJson(Map<String, dynamic> json)
    : overall = json['overall'],
      nice = json['nice'],
      loveIt = json['love_it'],
      funny = json['funny'],
      confusing = json['confusing'],
      informative = json['informative'],
      wellWritten = json['well_written'],
      creative = json['creative'];

  @override
  String toString() {
    Map<String, int> map = {
      "👍": nice,
      "❤️": loveIt,
      "😂": funny,
      "😕": confusing,
      "📘": informative,
      "✍️": wellWritten,
      "🎨": creative,
    };
    List<MapEntry<String, int>> list =
        map.entries.where((e) => e.value > 0).toList();
    list.sort((a, b) => b.value.compareTo(a.value));
    return "${list.map((e) => e.key).join()} $overall";
  }
}
/*
Nice – 👍
Love it – ❤️
Funny – 😂
Confusing – 😕
Informative – 📘
Well written – ✍️
Creative – 🎨
*/