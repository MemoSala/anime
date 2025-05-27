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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        hintColor: Colors.white,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 15),
        focusColor: Colors.white,
        hintColor: Colors.grey.shade900,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
        ),
      ),
      getPages: routes,
    );
  }
}
