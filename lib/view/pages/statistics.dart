import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/statistics_controller.dart';
import '../../data/api/object_bloc.dart';
import '../../data/models/statistics_model.dart';
import '../widgets/object_bloc_consumer.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    StatisticsController controller = Get.put(StatisticsController());
    return Scaffold(
      appBar: AppBar(title: Text("الإحصائيات")),
      body: ObjectBlocConsumer<
        StatisticsFetchingSuccessfulState,
        StatisticsAnimeInitialFatchEvent
      >(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        builder: (state) {
          StatisticsModel statistics = state.statistics;
          bool isNotEmptyScores =
              statistics.scores.where((e) => e.votes != 0).isNotEmpty;
          if (statistics.total != 0 && isNotEmptyScores) NoData();
          return SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (statistics.total != 0) ...[
                    Text(
                      "ملخص الإحصائيات",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BoxStatistic(
                      title: "مشاهدة",
                      value: statistics.watching,
                      total: statistics.total,
                    ),
                    BoxStatistic(
                      title: "مكتملة",
                      value: statistics.completed,
                      total: statistics.total,
                    ),
                    BoxStatistic(
                      title: "معلقة",
                      value: statistics.onHold,
                      total: statistics.total,
                    ),
                    BoxStatistic(
                      title: "منبوذ",
                      value: statistics.dropped,
                      total: statistics.total,
                    ),
                    BoxStatistic(
                      title: "مخطط للمشاهدة",
                      value: statistics.planToWatch,
                      total: statistics.total,
                    ),
                    BoxStatistic(title: "الإجمالي", value: statistics.total),
                    Divider(),
                  ],
                  if (isNotEmptyScores)
                    Text(
                      "إحصائيات التقييم",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  for (ScoresModel score in statistics.scores.reversed)
                    if (score.votes != 0)
                      BoxStatistic.rate(
                        title: "${score.score} ⭐",
                        rate: score.percentage,
                        value: score.votes,
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BoxStatistic extends StatelessWidget {
  const BoxStatistic({
    super.key,
    required this.title,
    required this.value,
    this.total,
  });

  const BoxStatistic.rate({
    super.key,
    required this.title,
    required this.value,
    required double rate,
  }) : total = 100 * value ~/ rate;
  final String title;
  final int value;
  final int? total;

  @override
  Widget build(BuildContext context) {
    final double rate = value / (total ?? value);
    final double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Text("$title - $value (${(rate * 100).round()}%)"),
        SizedBox(height: 5),
        Container(
          height: 20,
          width: (width - 20) * rate,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.amber,
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
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
