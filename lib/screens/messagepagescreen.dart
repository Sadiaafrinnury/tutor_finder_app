import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart';

class Messagepagescreen extends StatelessWidget {
  const Messagepagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // Make AppBar taller
        child: AppBar(
          backgroundColor: primaryBlue,
          leading: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
          title: Row(
            children: [
              Text(
                ArrowBackText,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              Spacer(), // This pushes the content to the left
            ],
          ),
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 23),
              child: Text(
                'Message', // The text below "Back"
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 30,
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image(
                  image: AssetImage(
                      VectorPng,
                  ),
              ),
          ),
          Text(
            MessageDetailText,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 30,
                color: blackColor,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
