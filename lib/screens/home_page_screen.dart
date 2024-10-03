import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart';
import '../widgets/searchbar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: primaryBlue,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          // Background Image (HomepageVector1)
          Positioned(
            bottom: 560,
            child: Container(
              width: 308,
              height: 213,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    HomepageVector1,
                  ), // Background image
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          // Text (I need the tutor for)
          Positioned(
            bottom: 635,
            left: 160,
            child: Text(
              HomePageText,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ),
          ),
          // Foreground Image (MyTutorLogo)
          Positioned(
            bottom: 640,
            left: 150,
            child: Container(
              width: 160,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    MyTutorLogo,
                  ), // Foreground image
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 590,
            left: 20,
            right: 20,
            child: Searchbar(),
          ),
          Positioned(
            top: 175,
            left: 0,
            child: Container(
              height: 7,
              width: 450,
              color: primaryBlue,
            ),
          ),
          Positioned.fill(
            top: 170, // This moves the GridView down.
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              // Additional padding if needed
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: buildGridItems(), // Use the helper method for grid items
              ),
            ),
          ),
      Positioned(
        top: 600, // Adjust this value if needed
        left: 2,
        child: Container(
          height: 130,
          width: 420,
          decoration: BoxDecoration(
            color: primaryBlue,
            image: DecorationImage(
              image: AssetImage(
                  Vectorpng3,
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
          Positioned(
            top: 620,
            left: 190,
            child: Text(
              QuestionText,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 27,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                )
            ),
          ),
          Positioned(
            top: 650,
            left: 250,
            child: Text(
                NoListingText,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                )
            ),
          ),
          Positioned(
            top: 685,
            left: 264,
            child: Container(
              height: 30,
              width: 86,
              decoration: BoxDecoration(
                color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(13, 10, 0, 0),
                child: Text(
                    ApplyText,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: blackColor,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildGridItems() {
    // List of text items for the grid
    List<String> texts = [
      ViolinText,
      TrumpetText,
      PianoText,
      MathematicsText,
      ElectronicText,
      HistoryText,
      WaterPaintingText,
      CeramicText,
      OilPaintingText,
    ];

    // List of images corresponding to the text items
    List<String> images = [
      Violin,
      Trumpet,
      Piano,
      Math,
      Electronic,
      History,
      WaterPainting,
      Ceramic,
      OilPainting,
    ];

    // Ensure the number of items in texts and images matches
    assert(texts.length == images.length);

    // Generate all 9 grid items
    return List.generate(9, (index) {
      return Container(
        height: 85,
        width: 104,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white70,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adding image to the container
            Image.asset(
              images[index],
              height: 65,
              width: 104,
              fit: BoxFit
                  .cover,
            ),
            SizedBox(height: 5),
            Text(
              texts[index],
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}