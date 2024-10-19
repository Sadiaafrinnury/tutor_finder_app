import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_finder_app/util/app_colors.dart'; // Ensure this file includes your color definitions
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart'; // Assuming Message is defined here

class MessageScreen extends StatelessWidget {
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
          Message, // or any other title based on your current screen
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
              VectorPng, // Update with your actual image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              MessageDetailText, // Ensure MessageDetailText is defined
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


