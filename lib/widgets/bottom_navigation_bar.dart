import 'package:flutter/material.dart';
import 'package:tutor_finder_app/screens/home_page_screen.dart';
import 'package:tutor_finder_app/screens/messagepagescreen.dart';
import 'package:tutor_finder_app/screens/myclassscreen.dart';
import 'package:tutor_finder_app/screens/tutor_detail_screen.dart';
import 'package:tutor_finder_app/screens/tutorlist_screen.dart';
import 'package:tutor_finder_app/util/app_images.dart';

class MyBottomNavigationbar extends StatefulWidget {
  @override
  _MyBottomNavigationbarState createState() => _MyBottomNavigationbarState();
}

class _MyBottomNavigationbarState extends State<MyBottomNavigationbar> {
  int _currentIndex = 0;

  // Move the screens list outside of the build method to avoid recreation on every build
  final List<Widget> _screens = [
    HomePageScreen(),
    Messagepagescreen(),
    Myclassscreen(),
    TutorlistScreen(),
    TutorDetailScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _screens[_currentIndex], // Directly use the widget corresponding to the selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image(image:
            AssetImage(
                HomeIcon
            ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(image:
            AssetImage(
                MessageIcon
            ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(image:
            AssetImage(
                MyClassIcon
            ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
