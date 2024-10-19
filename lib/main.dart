import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_finder_app/screens/home_page_screen.dart';
import 'package:tutor_finder_app/screens/message_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Tutor Finder",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/', page: () => HomePageScreen()),
        GetPage(
            name: '/', page: () => MessageScreen()),
      ],
      debugShowCheckedModeBanner: false,
      home: HomePageScreen(),
    );
  }
}

