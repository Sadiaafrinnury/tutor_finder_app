import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_finder_app/screens/home_page_screen.dart';
import 'package:tutor_finder_app/screens/profile_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import '../util/app_images.dart';
import '../widgets/custom_Bottom_navigation_bar.dart';
import 'message_screen.dart';


class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  final RxInt _selectedIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      ContactUsContent(),
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

class ContactUsContent extends StatelessWidget {
  const ContactUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () {
            // Add back button functionality here
          },
        ),
        title: Text(
            'Contact Us',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                maxLines: 30,
                decoration: InputDecoration(
                  hintText: 'Write your message here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: blueColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle the form submission
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              ContactusBackgroundImage, // Replace with your actual image asset
                              height: 150,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'The message has been sent, We will reply you ASAP.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Close the dialog and navigate back or to home

                                Get.to(() => HomePageScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blueColor,
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('HOME'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 16,
                      color: whiteColor
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'We will reply to you ASAP',
            style: TextStyle(
                color: greyColor,
                fontSize: 16),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}




