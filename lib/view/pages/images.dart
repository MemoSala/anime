import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/images_controller.dart';
import '../../data/api/object_bloc.dart';
import '../../data/models/images_model.dart';
import '../widgets/object_bloc_consumer.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    ImagesController controller = Get.put(ImagesController());
    return Scaffold(
      appBar: AppBar(title: Text("خلفيات")),
      body: ObjectBlocConsumer<
        ImagesFetchingSuccessfulState,
        ImagesAnimeInitialFatchEvent
      >(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        builder: (state) {
          List<ImageModel> images = state.images;
          if (images.isEmpty) const NoData();
          return GridView(
            padding: const EdgeInsets.all(4),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
              childAspectRatio: 6 / 9,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            children: [
              for (ImageModel images in images) Image.network(images.imageUrl),
            ],
          );
        },
      ),
    );
  }
}
