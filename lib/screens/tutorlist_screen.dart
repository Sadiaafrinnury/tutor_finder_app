import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_finder_app/screens/message_screen.dart';
import 'package:tutor_finder_app/screens/profile_screen.dart';
import 'package:tutor_finder_app/screens/tutor_detail_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart';
import 'package:tutor_finder_app/util/tutor_model.dart';
import 'package:tutor_finder_app/widgets/custom_Bottom_navigation_bar.dart';


class TutorListScreen extends StatefulWidget {
  const TutorListScreen({Key? key}) : super(key: key);

  @override
  State<TutorListScreen> createState() => _TutorListScreenState();
}

class _TutorListScreenState extends State<TutorListScreen> {
  final RxInt _selectedIndex = 0.obs; // Reactive variable for bottom navigation index

  final List<Widget> _pages = [
    TutorListPage(),   // Tutor list screen as one of the pages
    MessageScreen(),   // Message screen
    MyClassScreen(),   // My class screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[_selectedIndex.value]), // Display selected page
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex, // Current selected index
        onTap: (index) {
          _selectedIndex.value = index; // Update selected index
        },
        items: [
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
        ],
      ),
    );
  }
}

// Example page for Tutor List
class TutorListPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: blueColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back(); // Navigate back
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            ),
          ),
          title: Text(
            TutorText,
            style: TextStyle(
              color: whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: whiteColor,
                  ),
                );
              },
            )
          ],
        ),
      ),
      drawer: NavDrawer(),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildTutorCard(
            context,
            name: TutorNameText,
            description: TutorDetailText,
            rate: 80,
            availability: AvailabeTimeText,
            imageUrl: ProfileImage2,
            isOnline: true,
            isInPerson: true,
          ),
          _buildTutorCard(
            context,
            name: TutorNameText1,
            description: TutorDetailText1,
            rate: 50,
            availability: AvailabeTimeText1,
            imageUrl: ProfileImage1,
            isOnline: true,
            isInPerson: true,
          ),
          _buildTutorCard(
            context,
            name: TutorNameText2,
            description: TutorDetailText2,
            rate: 55,
            availability: AvailabeTimeText2,
            imageUrl: ProfileImage3,
            isOnline: true,
            isInPerson: false,
          ),
          _buildTutorCard(
            context,
            name: TutorNameText3,
            description: TutorDetailText3,
            rate: 80,
            availability: AvailabeTimeText3,
            imageUrl: ProfileImage4,
            isOnline: true,
            isInPerson: false,
          ),
          _buildTutorCard(
            context,
            name: TutorNameText4,
            description: TutorDetailText4,
            rate: 35,
            availability: AvailabeTimeText4,
            imageUrl: ProfileImage5,
            isOnline: true,
            isInPerson: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTutorCard(
      BuildContext context, {
        required String name,
        required String description,
        required double rate,
        required String availability,
        required String imageUrl,
        required bool isOnline,
        required bool isInPerson,
      }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(imageUrl),
                ),
                SizedBox(height: 8.0),
                if (isOnline)
                  Chip(
                    label: Text(
                      OnlineClassText,
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                  ),
                if (isInPerson)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Chip(
                      label: Text(
                        PersonClassText,
                        style: TextStyle(
                          color: whiteColor,
                        ),
                      ),
                      backgroundColor: blueColor,
                    ),
                  ),
              ],
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$$rate /Hr',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Available time\n$availability',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Pass the tutor details to TutorDetailScreen
                    Get.to(TutorDetailScreen(
                      tutor: Tutor(
                        name: name,
                        profileImage: imageUrl,
                        rate: rate,
                        isOnline: isOnline,
                        isInPerson: isInPerson,
                      ),
                    ));
                  },
                  child: Text(
                    TutorProfileDetailText,
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: blueColor, // Blue background color
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sort by',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: whiteColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Divider(color: whiteColor), // Optional: Adds a line separator
          ListTile(
            title: Text(
              'Distance',
              style: TextStyle(color: whiteColor),
            ),
            onTap: () {
              // Add your sorting logic here
              Navigator.pop(context);
            },
          ),
          Divider(color: whiteColor),
          ListTile(
            title: Text(
              'Price',
              style: TextStyle(color: whiteColor),
            ),
            onTap: () {
              // Add your sorting logic here
              Navigator.pop(context);
            },
          ),
          Divider(color: whiteColor),
          ListTile(
            title: Text(
              'Online class',
              style: TextStyle(color: whiteColor),
            ),
            onTap: () {
              // Add your sorting logic here
              Navigator.pop(context);
            },
          ),
          Divider(color: whiteColor),
          ListTile(
            title: Text(
              'Offline class',
              style: TextStyle(color: whiteColor),
            ),
            onTap: () {
              // Add your sorting logic here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

