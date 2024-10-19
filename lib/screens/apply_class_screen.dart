import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

import '../util/app_images.dart'; // Import this for full-screen

class TutorFormScreen extends StatefulWidget {
  @override
  State<TutorFormScreen> createState() => _TutorFormScreenState();
}

class _TutorFormScreenState extends State<TutorFormScreen> {
  // Variables to store the picked images
  File? _profileImage;
  File? _galleryImage;

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _classCategoryController = TextEditingController();
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _tuitionController = TextEditingController();
  final TextEditingController _classTimeController = TextEditingController();
  final TextEditingController _resumeController = TextEditingController();
  final TextEditingController _classIntroController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Set app to full-screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); // Full screen
  }

  // Method to pick an image from the gallery for profile
  Future<void> _pickProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Method to pick an image from the gallery for additional image
  Future<void> _pickGalleryImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _galleryImage = File(pickedFile.path);
      });
    }
  }

  // Method to handle form submission and show confirmation dialog
  Future<void> _handleSubmit() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String className = _classNameController.text;
    final String classTime = _classTimeController.text;
    final String tuition = _tuitionController.text;

    if (name.isEmpty || email.isEmpty || className.isEmpty || classTime.isEmpty || tuition.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    // Show a dialog box with submitted data
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please confirm below'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi $name'),
              Text('E-mail: $email'),
              Text('Class name: $className'),
              Text('Class time: $classTime'),
              Text('Tuition per hour: \$$tuition'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.offNamed('/home');
              },
              child: Text(
                'Confirmed',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Back',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'BACK',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height: 250,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    Applyclassimage,
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 4.0,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[300],
                            backgroundImage:
                            _profileImage != null ? FileImage(_profileImage!) : null,
                            child: _profileImage == null
                                ? Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.white,
                            )
                                : null,
                          ),
                        ),
                        GestureDetector(
                          onTap: _pickProfileImage,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        buildTextField('Name', _nameController),
                        buildTextField('E-mail', _emailController),
                        buildTextField('Phone', _phoneController),
                        buildTextField('Class Category', _classCategoryController),
                        buildTextField('Class Name', _classNameController),
                        buildTextField('Tuition per hour', _tuitionController),
                        buildTextField('Class Time', _classTimeController),
                        buildTextField('Resume', _resumeController),
                        buildTextField('Class Introduction', _classIntroController),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: Text(
                                'Add image',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: _pickGalleryImage,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  child: _galleryImage != null
                                      ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      _galleryImage!,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                      : Center(
                                    child: Icon(
                                      Icons.add_photo_alternate,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _handleSubmit,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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

  // Helper method to build text fields
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}











