class StatisticsModel {
  final int watching;
  final int completed;
  final int onHold;
  final int dropped;
  final int planToWatch;
  final int total;
  final List<ScoresModel> scores;
  const StatisticsModel({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
    required this.total,
    required this.scores,
  });

  StatisticsModel.fromJson(Map<String, dynamic> json)
    : watching = json["watching"],
      completed = json["completed"],
      onHold = json["on_hold"],
      dropped = json["dropped"],
      planToWatch = json["plan_to_watch"],
      total = json["total"],
      scores =
          (json["scores"] as List).map((e) => ScoresModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
    "watching": watching,
    "completed": completed,
    "on_hold": onHold,
    "dropped": dropped,
    "plan_to_watch": planToWatch,
    "total": total,
    "scores": scores.map((e) => e.toJson()),
  };
}

class ScoresModel {
  final int score;
  final int votes;
  final double percentage;

  const ScoresModel({
    required this.percentage,
    required this.score,
    required this.votes,
  });

  ScoresModel.fromJson(Map<String, dynamic> json)
    : score = json["score"],
      votes = json["votes"],
      percentage = json["percentage"].toDouble();

  Map<String, num> toJson() => {
    "score": score,
    "votes": votes,
    "percentage": percentage,
  };
}

/*
watching         =>      مشاهدة
completed        =>      مكتملة
onHold           =>      معلقة
dropped          =>      مُسقطة
planToWatch      =>      مخطط للمشاهدة
total            =>      الإجمالي
---              =>      ---
score            =>      النتيجة
votes            =>      الأصوات
percentage       =>      النسبة المئوية
*/
