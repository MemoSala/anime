import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime',
      // locale: Locale("ar", "AR"),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        focusColor: const Color.fromARGB(255, 0, 0, 0),
        hintColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(),
        focusColor: Colors.white,
        hintColor: Colors.grey.shade900,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      getPages: routes,
    );
  }
}
