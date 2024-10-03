import 'package:flutter/material.dart';
import 'package:tutor_finder_app/screens/tutorlist_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: primaryBlue,
          width: 2.0,
        ),
      ),
      child: TextField(
        onSubmitted: (value) {
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context)=>TutorlistScreen()),
          );
        },
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 14,
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: blackColor,
            size: 20,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
        style: const TextStyle(
          color: blackColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
