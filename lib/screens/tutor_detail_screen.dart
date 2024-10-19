import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tutor_finder_app/screens/message_screen.dart';
import 'package:tutor_finder_app/screens/profile_screen.dart';
import 'package:tutor_finder_app/util/app_colors.dart';
import 'package:tutor_finder_app/util/app_images.dart';
import 'package:tutor_finder_app/util/text_cons.dart';
import 'package:tutor_finder_app/util/tutor_model.dart';
import 'package:tutor_finder_app/widgets/custom_Bottom_navigation_bar.dart';


class TutorDetailScreen extends StatefulWidget {

  final Tutor tutor;

  TutorDetailScreen({required this.tutor});

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {

  final RxInt _selectedIndex = 0.obs;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize the _pages list inside initState
    _pages = [
      TutorDetailContent(tutor: widget.tutor),
      MessageScreen(),
      MyClassScreen(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[_selectedIndex.value]),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex.value = index;
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



class TutorDetailContent extends StatefulWidget {

  final Tutor tutor;

  TutorDetailContent({required this.tutor});

  @override
  State<TutorDetailContent> createState() => _TutorDetailContentState();
}

class _TutorDetailContentState extends State<TutorDetailContent> {
  int _currentStep = 0;
  String _selectedClassType = '';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _showClassTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height: 300,
                width: 300,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Step indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _currentStep = 0),
                          child: _buildStepIndicator(context, 'Class Type', isActive: _currentStep == 0),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _currentStep = 1),
                          child: _buildStepIndicator(context, 'Time Select', isActive: _currentStep == 1),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _currentStep = 2),
                          child: _buildStepIndicator(context, 'Confirm', isActive: _currentStep == 2),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Step Content
                    Expanded(
                      child: _buildStepContent(context, setState),
                    ),
                    // Bottom Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentStep > 0)
                          ElevatedButton(
                            onPressed: () => setState(() => _currentStep--),
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blueColor, // Set text color to blue
                              ),
                            ),
                          ),
                        if (_currentStep < 2)
                          ElevatedButton(
                            onPressed: () {
                              if (_currentStep == 1 && (_selectedDate == null || _selectedTime == null)) {
                                // Show a message to select date and time
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please select a date and time',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                                return;
                              }
                              setState(() => _currentStep++);
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blueColor, // Set text color to blue
                              ),
                            ),
                          ),
                        if (_currentStep == 2)
                          ElevatedButton(
                            onPressed: () {
                              // Confirm action
                              Navigator.pop(context);
                              _showConfirmationDialog(context);
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blueColor, // Set text color to blue
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStepIndicator(BuildContext context, String label, {required bool isActive}) {
    return Text(
      label,
      style: TextStyle(
        color: isActive ? Colors.blue : Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _buildStepContent(BuildContext context, StateSetter setState) {
    switch (_currentStep) {
      case 0:
        return Column(
          children: [
            GestureDetector(
              onTap: () => setState(() => _selectedClassType = 'Online Class'),
              child: _buildClassOption(context, 'Online Class', isSelected: _selectedClassType == 'Online Class'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => setState(() => _selectedClassType = 'In-person Class'),
              child: _buildClassOption(context, 'In-person Class', isSelected: _selectedClassType == 'In-person Class'),
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        colorScheme: ColorScheme.light(
                          primary: blueColor, // Set the color for header background and selected date
                          onPrimary: whiteColor, // Text color for header and selected date
                          onSurface: blueColor, // Text color for the days
                        ),
                        dialogBackgroundColor: whiteColor,
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (date != null) {
                  setState(() => _selectedDate = date);
                }
              },
              child: Text(
                _selectedDate != null
                    ? 'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}'
                    : 'Select Date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blueColor),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        colorScheme: ColorScheme.light(
                          primary: blueColor, // Set the color for header background and selected time
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (time != null) {
                  setState(() => _selectedTime = time);
                }
              },
              child: Text(
                _selectedTime != null ? 'Selected Time: ${_selectedTime!.format(context)}' : 'Select Time',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blueColor),
              ),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Text(
              'Class Type: $_selectedClassType',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blueColor),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${_selectedDate?.toLocal().toString().split(' ')[0] ?? 'Not selected'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blueColor),
            ),
            SizedBox(height: 10),
            Text(
              'Time: ${_selectedTime?.format(context) ?? 'Not selected'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blueColor),
            ),
          ],
        );
      default:
        return SizedBox.shrink();
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: 300,
            width: 250,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                    image: AssetImage(
                        HomepageVector,
                    ),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Thanks!\nThe tutor will contact you soon',
                    textAlign: TextAlign.center, // Center align the text
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: blueColor, // Set text color to blue
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blueColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildClassOption(BuildContext context, String classType, {required bool isSelected}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? blueColor : Colors.grey[300],
      ),
      child: Text(
        classType,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey, // Set unselected text color to grey
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


 // To track selected class type
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: blueColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          TutorDetail,
          style: TextStyle(
              color: whiteColor,
              fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(widget.tutor.profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 160),
                  // Tutor Details Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tutor.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$${widget.tutor.rate} /Hr',
                          style: TextStyle(
                            fontSize: 18,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _showClassTypeDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            ApplyText,
                            style: TextStyle(
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // Class Type Chips
              Column(
                children: [
                  Chip(
                    label: Text(
                      OnlineClassText,
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      PersonClassText,
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    backgroundColor: blueColor,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Resume Section
              Text(
                ResumeText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                ResumeDetail,
              ),
              SizedBox(height: 20),
              // Curriculum Section
              Text(
                CurriculumText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                CurriculumDetailText,
              ),
              SizedBox(height: 20),
              // Images Section
              Text(
                ImageText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage(
                        DetailClassImage,
                      ),
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Image(
                      image: AssetImage(
                        DetailClassImage1,
                      ),
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Image(
                      image: AssetImage(
                        DetailClassImage2,
                      ),
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}







