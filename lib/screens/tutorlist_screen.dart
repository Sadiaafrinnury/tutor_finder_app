import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_finder_app/screens/tutor_detail_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart';
import 'package:tutor_finder_app/widgets/bottom_navigation_bar.dart';

class TutorlistScreen extends StatelessWidget {
  const TutorlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Make AppBar taller
        child: AppBar(
          backgroundColor: primaryBlue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            ),
            onPressed: () {
              Get.back(); // Use Get.back() to return to the previous screen
            },
          ),
          title: Row(
            children: [
              Text(
                ArrowBackText,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
              const Spacer(), // This pushes the content to the left
            ],
          ),
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 23),
              child: Row(
                children: [
                  Text(
                    TutorText, // The text below "Back"
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(260,  0, 0, 10),
                    child: Icon(
                      Icons.menu,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Image(image:
                      AssetImage(
                          ProfileImage2,
                      ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  OnlineClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  PersonClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        TutorNameText,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30), // Add some spacing between the texts
                      Text(
                        TutorDetailText,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Row(
                        children: [
                          Text(
                            TutorRateText,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            HourlyText,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        AvailableText,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),// Add some spacing between the texts
                      Text(
                        AvailabeTimeText,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),
                        SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 10, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(TutorDetailScreen());
                            },
                            child: Text(
                              TutorProfileDetailText,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add some spacing before the Divider
            Divider(
              color: Colors.grey,
              thickness: 2,      // Controls the thickness of the line
              height: 35,        // Space around the divider
              indent: 0,         // No padding from the left, full-width
              endIndent: 0,      // No padding from the right, full-width
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Image(image:
                      AssetImage(
                        ProfileImage1,
                      ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  OnlineClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  PersonClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        TutorNameText1,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30), // Add some spacing between the texts
                      Text(
                        TutorDetailText1,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Row(
                        children: [
                          Text(
                            TutorRateText1,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            HourlyText,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        AvailableText,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),// Add some spacing between the texts
                      Text(
                        AvailabeTimeText1,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 10, 0, 0),
                          child: Text(
                            TutorProfileDetailText,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add some spacing before the Divider
            Divider(
              color: Colors.grey,
              thickness: 2,      // Controls the thickness of the line
              height: 35,        // Space around the divider
              indent: 0,         // No padding from the left, full-width
              endIndent: 0,      // No padding from the right, full-width
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Image(image:
                      AssetImage(
                        ProfileImage3,
                      ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  OnlineClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  PersonClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        TutorNameText2,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30), // Add some spacing between the texts
                      Text(
                        TutorDetailText2,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Row(
                        children: [
                          Text(
                            TutorRateText2,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            HourlyText,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        AvailableText,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),// Add some spacing between the texts
                      Text(
                        AvailabeTimeText2,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 10, 0, 0),
                          child: Text(
                            TutorProfileDetailText,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add some spacing before the Divider
            Divider(
              color: Colors.grey,
              thickness: 2,      // Controls the thickness of the line
              height: 35,        // Space around the divider
              indent: 0,         // No padding from the left, full-width
              endIndent: 0,      // No padding from the right, full-width
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Image(image:
                      AssetImage(
                        ProfileImage4,
                      ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  OnlineClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        TutorNameText3,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30), // Add some spacing between the texts
                      Text(
                        TutorDetailText3,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Row(
                        children: [
                          Text(
                            TutorRateText3,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            HourlyText,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        AvailableText,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),// Add some spacing between the texts
                      Text(
                        AvailabeTimeText3,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 10, 0, 0),
                          child: Text(
                            TutorProfileDetailText,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add some spacing before the Divider
            Divider(
              color: Colors.grey,
              thickness: 2,      // Controls the thickness of the line
              height: 35,        // Space around the divider
              indent: 0,         // No padding from the left, full-width
              endIndent: 0,      // No padding from the right, full-width
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Image(image:
                      AssetImage(
                        ProfileImage5,
                      ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  OnlineClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        height: 30,
                        width: 120, // Increased the width to give more space
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18, right: 5,
                          ), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
                            children: [
                              Image(
                                image: AssetImage(checkIcon),
                                height: 15, // Increased icon size
                                width: 15, // Increased icon size
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 5), // Added space between icon and text
                              Expanded( // Wrap the Text widget inside Expanded
                                child: Text(
                                  PersonClassText,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: primaryBlue,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensure the text doesn't overflow
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        TutorNameText4,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30), // Add some spacing between the texts
                      Text(
                        TutorDetailText4,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Row(
                        children: [
                          Text(
                            TutorRateText4,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            HourlyText,
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        AvailableText,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),// Add some spacing between the texts
                      Text(
                        AvailabeTimeText4,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        //maxLines: 1, // Restrict to 1 line
                        overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 10, 0, 0),
                          child: Text(
                            TutorProfileDetailText,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add some spacing before the Divider
            Divider(
              color: Colors.grey,
              thickness: 2,      // Controls the thickness of the line
              height: 35,        // Space around the divider
              indent: 0,         // No padding from the left, full-width
              endIndent: 0,      // No padding from the right, full-width
            ),
          ],
        ),
      ),
    );
  }
}



