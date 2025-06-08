import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/reviews_controller.dart';
import '../../core/function/translator.dart';
import '../../data/api/object_bloc.dart';
import '../../data/models/review_model.dart';
import '../widgets/button_read_more.dart';
import '../widgets/object_bloc_consumer.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewsController controller = Get.put(ReviewsController());
    return Scaffold(
      appBar: AppBar(title: Text("مراجعات")),
      body: ObjectBlocConsumer<
        ReviewsFetchingSuccessfulState,
        ReviewsAnimeInitialFatchEvent
      >(
        onError: controller.getBloc,
        bloc: controller.objectBloc,
        builder: (state) {
          List<ReviewModel> reviews = state.reviews;
          if (reviews.isEmpty) return const NoData();
          reviews.sort((a, b) => b.date.compareTo(a.date));
          return ListView.separated(
            padding: const EdgeInsets.all(4),
            itemCount: reviews.length,
            itemBuilder: (context, i) => Review(review: reviews[i]),
            separatorBuilder: (context, i) => Divider(),
          );
        },
      ),
    );
  }
}

class Review extends StatefulWidget {
  const Review({super.key, required this.review});

  final ReviewModel review;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  bool isReadMore = false;
  bool isTranslat = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              widget.review.user.images.first.imageUrl,
            ),
          ),
          title: Text(widget.review.user.username),
          titleTextStyle: TextStyle(color: Theme.of(context).focusColor),
          subtitle: Text(
            "${DateFormat('E - yyyy MMM d').format(widget.review.date)}\n${widget.review.tags.join(", ")}",
          ),
          subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 10),
          trailing: ButtonReadMore(url: widget.review.user.url),
        ),
        Container(
          padding: EdgeInsets.all(7),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(7),
              bottomLeft: Radius.circular(7),
              bottomRight: Radius.circular(7),
            ),
            color: Theme.of(context).hintColor,
          ),
          child:
              isTranslat
                  ? FutureBuilder(
                    future: translator(widget.review.review),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!,
                          textDirection: TextDirection.rtl,
                          maxLines: isReadMore ? 100 : 8,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10),
                        );
                      } else {
                        return Container(
                          height: 100,
                          alignment: Alignment.center,
                          child: Text(
                            snapshot.hasError ? "خطأ فى الترجمة!؟" : "تحميل...",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 10),
                          ),
                        );
                      }
                    },
                  )
                  : Text(
                    widget.review.review,
                    maxLines: isReadMore ? 100 : 8,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10),
                  ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).hintColor,
                ),
                child: Text(
                  "${widget.review.reactions}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              SizedBox(width: 5),
              ButtonReviews(
                onPressed: () => setState(() => isReadMore = !isReadMore),
                text: !isReadMore ? "اقرأ المزيد" : "إظهار أقل",
                icon:
                    !isReadMore
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
              ),
              ButtonReviews(
                onPressed: () => setState(() => isTranslat = !isTranslat),
                text: "ترجمة",
                icon: Icons.translate,
              ),
              ButtonReviews(
                onPressed: () => launchUrl(Uri.parse(widget.review.url)),
                text: "المزيد من التفاصيل",
                icon: Icons.read_more_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonReviews extends StatelessWidget {
  const ButtonReviews({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  final IconData icon;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
        child: Row(
          children: [
            Icon(icon, size: 14),
            SizedBox(width: 2),
            Text(text, style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
