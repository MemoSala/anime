import 'package:flutter/material.dart';

class AllDateAnime extends StatelessWidget {
  const AllDateAnime({super.key});
  final List<String> list = const <String>["شتاء", "ربيع", "صيف", "خريف"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = DateTime.now().year + 2; i > 1972; i--)
          Column(
            children: [
              const SizedBox(height: 5),
              Text(
                "$i",
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  height: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(list.length, (index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 70,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(
                                  255,
                                  15,
                                  15,
                                  15,
                                ).withAlpha(51),
                                offset: const Offset(0, 1.5),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            list[index],
                            style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 5),
            ],
          ),
        const SizedBox(height: 10),
      ],
    );
  }
}
