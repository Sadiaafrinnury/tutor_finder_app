import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_finder_app/util/app_colors.dart';

class CustomBottomNavigationBarItem extends BottomNavigationBarItem {
  final Icon icon;
  final String label;


  CustomBottomNavigationBarItem({
    required this.icon,
    required this.label,

  }) : super(
    icon: icon,
    label: label,

  );
}


class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomBottomNavigationBarItem> items;
  final RxInt currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      items: widget.items,
      currentIndex: widget.currentIndex.value,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: blueColor,
      unselectedItemColor: greyColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 15,
      backgroundColor: whiteColor,
    ));
  }
}
