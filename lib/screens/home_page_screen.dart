import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutor_finder_app/screens/apply_class_screen.dart';
import 'package:tutor_finder_app/screens/contact_us_screen.dart';
import 'package:tutor_finder_app/screens/message_screen.dart';
import 'package:tutor_finder_app/screens/profile_screen.dart';
import 'package:tutor_finder_app/screens/tutorlist_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart';
import 'package:tutor_finder_app/widgets/custom_Bottom_navigation_bar.dart';
import 'package:tutor_finder_app/widgets/custom_searchbar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final RxInt _selectedIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePageContent(searchController: searchController),
      MessageScreen(),
      MyClassScreen(),
    ];
  }

  final List<CustomBottomNavigationBarItem> _bottomNavigationBarItems = [
    CustomBottomNavigationBarItem(
      icon: const Icon(
        Icons.home,
        size: 40,
      ),
      label: 'Home',
    ),
    CustomBottomNavigationBarItem(
      icon: const Icon(
        Icons.mail,
        size: 40,
      ),
      label: 'Message',
    ),
    CustomBottomNavigationBarItem(
      icon: const Icon(
        Icons.school,
        size: 40,
      ),
      label: 'My Class',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Obx(
            () => IndexedStack(
          index: _selectedIndex.value,
          children: pages,
        ),
      ), // Wrap IndexedStack with Obx for reactivity
      bottomNavigationBar: CustomBottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex, // Use .value to get int
        onTap: (index) {
          // Update _selectedIndex value to switch pages
          _selectedIndex.value = index;
        },
      ),
    );
  }
}




class HomePageContent extends StatefulWidget {
  final TextEditingController searchController;

  const HomePageContent({super.key, required this.searchController});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: greyColor,
              ),
            );
          },
        )
      ),
      drawer:  NavDrawer() ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 130, 0),
                  child: Image(
                    image: AssetImage(
                      HomepageVector1,
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(
                        MyTutorLogo,
                      ),
                      height: 80,
                    ),
                    Text(
                      HomePageText,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomSearchBar(
                        controller: widget.searchController,
                        onChanged: (query) {
                          if (query.isNotEmpty) {
                            Get.to(() => TutorListScreen());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 8,
              width: 430,
              color: blueColor,
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildCategoryTile(ViolinText, Violin),
                _buildCategoryTile(TrumpetText, Trumpet),
                _buildCategoryTile(PianoText, Piano),
                _buildCategoryTile(MathematicsText, Math),
                _buildCategoryTile(ElectronicText, Electronic),
                _buildCategoryTile(HistoryText, History),
                _buildCategoryTile(WaterPaintingText, WaterPainting),
                _buildCategoryTile(CeramicText, Ceramic),
                _buildCategoryTile(OilPaintingText, OilPainting),
              ],
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: blueColor,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image(
                      image: AssetImage(
                        Vectorpng3,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 60, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          QuestionText,
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text(
                            NoListingText,
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: whiteColor),
                            onPressed: () {
                              Get.to(TutorFormScreen());
                            },
                            child: Text(
                              ApplyText,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Widget _buildCategoryTile(String title, String imagePath) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Container(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}



class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: blueColor,
      child: ListView(
        padding: EdgeInsets.only(top: 100),
        children: [
          ListTile(
            leading: Icon(
              Icons.mail,
              color: whiteColor,
              size: 30,
            ),
            title: Text(
              'Message',
              style: TextStyle(
                color: whiteColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(
              Icons.school,
              color: whiteColor,
              size: 25,
            ),
            title: Text(
              'My Class',
              style: TextStyle(
                color: whiteColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(
              Icons.info,
              color: whiteColor,
              size: 25,
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(
                color: whiteColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Get.to(ContactUsScreen());
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}



