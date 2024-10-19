import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  //final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final double height;
  final double width;

  const CustomSearchBar({
    Key? key,
    //required this.controller,
    required this.onChanged,
    this.hintText = 'Search',
    this.height = 50.0,
    this.width = 250.0,
    required TextEditingController controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        //controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
              Icons.search,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}


class SearchController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}