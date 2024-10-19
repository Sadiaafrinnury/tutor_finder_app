import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_finder_app/screens/home_page_screen.dart';
import 'package:tutor_finder_app/screens/message_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart';

class MyClassScreen extends StatelessWidget {
  final RxInt _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        leading: _selectedIndex.value == 0
            ? IconButton(
          onPressed: () {
            Get.back(); // Navigate back
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        )
            : null, // Hide back button on Message and MyClass screens
        title: Text(
          MyClassText, // or any other title based on your current screen
          style: TextStyle(
            color: whiteColor,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              VectorPng, // Replace with your actual image path
              width: 200,
              height: 200,
            ),
            Text(
              NoUpcomingClassText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}