import 'package:flutter/material.dart';

import '../../../core/class/anime/anime_order_by.dart';
import '../../../data/api/object_bloc.dart';
import '../home/home_body.dart';

class ListAnimeDateRange extends StatefulWidget {
  const ListAnimeDateRange(this.indexSeason, {super.key});
  final int indexSeason;

  @override
  State<ListAnimeDateRange> createState() => _ListAnimeDateRangeState();
}

class _ListAnimeDateRangeState extends State<ListAnimeDateRange> {
  final ObjectBloc objectBloc = ObjectBloc();

  @override
  void initState() {
    DateTime now = DateTime.now();
    objectBloc.add(
      AnimesInitialFatchEvent(
        orderBy: AnimeOrderBy.start_date,
        startDate: DateTime(
          now.year,
          1 + now.month + 3 * widget.indexSeason,
          1,
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    objectBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeBody(bloc: objectBloc);
  }
}
