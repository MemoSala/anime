import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/object_bloc.dart';

class ObjectBlocConsumer<S, T> extends StatelessWidget {
  const ObjectBlocConsumer({
    super.key,
    required this.bloc,
    required this.builder,
    required this.onError,
  });
  final ObjectBloc bloc;
  final Widget Function(S state) builder;
  final void Function()? onError;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObjectBloc, ObjectState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is T,
      buildWhen: (previous, current) => current is! T,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.runtimeType == ObjectFetchingLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.runtimeType == ObjectFetchingLimitState) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onError,
                  color: Theme.of(context).focusColor,
                  icon: Icon(Icons.refresh),
                ),
                Text(
                  "خطأ في الاتصال، حاول من جديد.",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Theme.of(context).focusColor),
                ),
              ],
            ),
          );
        } else if (state.runtimeType == ObjectFetchingErrorState) {
          String error = (state as ObjectFetchingErrorState).error;
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error, color: Colors.red),
                Text(error, style: TextStyle(color: Colors.red)),
              ],
            ),
          );
        } else if (state.runtimeType == S) {
          return builder(state as S);
        } else {
          return Center();
        }
      },
    );
  }
}

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "لا يوجد بيانات",
        style: TextStyle(color: Theme.of(context).focusColor),
      ),
    );
  }
}
