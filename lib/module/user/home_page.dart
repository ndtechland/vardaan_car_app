import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vardaancar/module/user/scheduled_booking.dart';

import '../../contantss/buttons/horizontal_circular_button.dart';
import '../../contantss/fixed_text_for_api.dart';
import '../../contantss/texts/3d_texts.dart';
import '../../controller/book_trip_controller.dart';
import '../../controller/contact_us_controller.dart';
import '../../controller/driver_controller/diver_banner_get_controller.dart';
import '../../controller/employee_controllers/edit_profile_employee_controller.dart';
import '../../controller/employee_controllers/employee_get_profile_controller.dart';
import '../../theme_color/theme_color.dart';
import 'book_trip.dart';
import 'contact_support_user.dart';
import 'drawer_user/drawer_cab.dart';
import 'get_profile_page.dart';
import 'map_tracking_page.dart';
import 'notification_page.dart';

class Testimonial {
  final String customerName;
  final String description;
  final int rating;
  final String imageUrl;

  Testimonial({
    required this.customerName,
    required this.description,
    required this.rating,
    required this.imageUrl,
  });
}

List<Color> colorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
];
List<String> Services1 = [
  'My Profile',
  'Help',
  'Emergency',
  //'Consumer Grievance',
];

///

List<String> Services2 = [
  'Track Your Cab',
  'Book Cab',
  'Scheduled Booking',
];

List<IconData> iconList1 = [
  Icons.person,
  Icons.help,
  Icons.emergency,
  //Icons.report_problem,
  // Icons.settings,
];

List<IconData> iconList2 = [
  Icons.track_changes,
  Icons.policy_sharp,
  Icons.punch_clock_outlined
  //repeat_sharp,
  // Icons.settings,
];

List<String> imageList = [
  'https://images.unsplash.com/photo-1600320254374-ce2d293c324e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3DD',
  'https://plus.unsplash.com/premium_photo-1661637975458-5359c6ff9ada?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1661306636048-5dfa19532575?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1661384269050-e5886bf33f6a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1661277663422-26a6fe569350?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
];

class HomePage extends StatelessWidget {
  ContactUsGetController _contactUsGetController =
      Get.put(ContactUsGetController());
  EmployeeGetProfileController _employeegetprofile =
      Get.put(EmployeeGetProfileController());
  final TripFormController tripformcontroller = Get.put(TripFormController());

  final List<Testimonial> testimonials = [
    Testimonial(
        customerName: 'Kumar Prince',
        description: 'Great Service! Very satisfied with the quality.',
        rating: 5,
        imageUrl:
            'https://images.unsplash.com/photo-1640951613773-54706e06851d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'

        ///todo:......
        // 'https://via.placeholder.com/50'
        ), // Sample placeholder image URL
    Testimonial(
        customerName: 'Kavi Singh',
        description: 'Good service but Service was delayed.',
        rating: 4,
        imageUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fHw%3D'
        // 'https://via.placeholder.com/50'
        ),
    Testimonial(
        customerName: 'Rakesh Gupta',
        description: 'The Service did not match the description.',
        rating: 2,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1689747698547-271d2d553cee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDQzfHx8ZW58MHx8fHx8'
        //  'https://via.placeholder.com/50'
        ),
    Testimonial(
        customerName: 'Michael Brown',
        description: 'Excellent customer support!',
        rating: 5,
        imageUrl: 'https://via.placeholder.com/50'),
    Testimonial(
        customerName: 'Alice Johnson',
        description: 'Average experience, expected better.',
        rating: 3,
        imageUrl: 'https://via.placeholder.com/50'),
  ];
  HomePage({Key? key}) : super(key: key);

  EmployeeGetProfileController _employeeGetProfileController =
      Get.put(EmployeeGetProfileController());

  UpdateProfileEmployeeController _updateProfileEmployeeController =
      Get.put(UpdateProfileEmployeeController());

  GlobalKey<ScaffoldState> _key = new GlobalKey();

  //String micccallnumber = "7666008833";

  // String customercare = "1912";

  // final Uri _url = Uri.parse(
  //     'http://hargharbijli.bsphcl.co.in/Grievanceportal/default.aspx');
  //

  //http://hargharbijli.bsphcl.co.in/Grievanceportal/default.aspx
  ///whats app launcher for mobile.....

  _launchWhatsApp() async {
    var whatsapp = "+917033355555";
    var message = "Hi Vardaan";

    if (Platform.isIOS) {
      var whatsappIOS =
          "whatsapp://wa.me/$whatsapp/?text=${Uri.encodeComponent(message)}";
      if (await canLaunch(whatsappIOS)) {
        await launch(whatsappIOS);
      } else {
        Get.snackbar(
          "WhatsApp not installed",
          "Please install WhatsApp",
          colorText: Colors.red.shade400,
          backgroundColor: Colors.white10,
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      }
    } else if (Platform.isAndroid) {
      var whatsappAndroid =
          "whatsapp://send?phone=$whatsapp&text=${Uri.encodeComponent(message)}";
      if (await canLaunch(whatsappAndroid)) {
        await launch(whatsappAndroid);
      } else {
        Get.snackbar(
          "WhatsApp not installed",
          "Please install WhatsApp",
          colorText: Colors.red.shade400,
          backgroundColor: Colors.white10,
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      }
    } else {
      // Platform not recognized
      Get.snackbar(
        "WhatsApp not supported on this platform",
        "WhatsApp is not supported on this platform",
        colorText: Colors.red.shade400,
        backgroundColor: Colors.white10,
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  ///url launcher for web...

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw 'Could not launch $_url';
  //   }
  // }

  // Function to launch URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to show emergency confirmation dialog
  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red[50], // Light red background for emergency
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red, // Warning icon for emergency
              ),
              SizedBox(width: 4),
              Text(
                'Emergency Confirmation',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to make an emergency call to ${_contactUsGetController.getContactUsModel?.data?.employeeEmergencyNumber}?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[700],
              ),
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Emergency color
              ),
              child: Text(
                'Yes, Call Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _launchURL(
                    'tel:${_contactUsGetController.getContactUsModel?.data?.employeeEmergencyNumber}');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      key: _key,
      //th1whtbackgrd,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              /// Get.to(LoginEmailPage());
              _key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: AppColors.a15,
            )),

        ///
        title: ThreeDtext(
          text: 'Vardaan Car'.tr,
          fontColor: AppColors.a15,
          //textmaroon505,
          fontSize: size.height * 0.030,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          letterSpacing: 1,
          shadowColor: AppColors.white,
          shadowBlurRadius: 3.0,
        )
        // Container(
        //   height: size.height * 0.05,
        //   width: size.width * 0.2,
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('lib/assets/video/suvidha33logo.jpeg'))),
        // ),
        ,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(notification_pagess());
            },
            child: Icon(
              Icons.notifications,
              color: AppColors.a15,
              size: size.width * 0.08,
            ),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),

          ///
          // InkWell(
          //   onTap: () {
          //    // Get.to(() => LanguagePagess());
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       vertical: size.height * 0.017,
          //     ),
          //     child: Container(
          //       height: size.height * 0.04,
          //       width: size.width * 0.22,
          //       decoration: BoxDecoration(
          //           //shape: BoxShape.circle,
          //           color: AppColors.white,
          //           borderRadius: BorderRadius.circular(12),
          //           border: Border.all(color: AppColors.textmaroon505)
          //
          //           //image:
          //           // DecorationImage(
          //           //     image: AssetImage('lib/assets/video/language23.gif'
          //           //         //'lib/assets/video/right-arrow.gif'
          //           //         ),
          //           //     fit: BoxFit.fill)
          //           ),
          //       child: ThreeDtext(
          //         text: 'English'.tr,
          //         fontColor: AppColors.textmaroon505,
          //         fontSize: size.width * 0.04,
          //         fontWeight: FontWeight.w600,
          //         color: AppColors.black,
          //         shadowColor: AppColors.white,
          //         shadowBlurRadius: 2,
          //       ),
          //       // child: Image.asset('lib/assets/images/right-arrow.gif')
          //     ),
          //   ),
          //   // Lottie.network(
          //   //   //https://lottie.host/b14c01a1-d38b-403e-ad43-c02da3404a19/QaZZTqLEwp.lottie
          //   //   'https://lottie.host/2adb7b33-4d1c-4977-ae68-9f148d2a036e/dts6uVWOCe.json',
          //   //   //'https://lottie.host/2adb7b33-4d1c-4977-ae68-9f148d2a036e/dts6uVWOCe.json',
          //   //   //'https://app.lottiefiles.com/animation/2fbfe658-4d63-4348-8cbf-254f00a89a29?panel=download',
          //   //   //'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json',
          //   //   height: 400.0,
          //   //   repeat: true,
          //   //   reverse: true,
          //   //   animate: true,
          //   // ),
          //   ///
          //   // Icon(
          //   //   Icons.translate,
          //   //   color: Colors.white,
          //   //   size: size.width * 0.08,
          //   // ),
          // ),
          ///
          SizedBox(
            width: size.width * 0.02,
          ),
        ],
        //Text("Suvidha"),
      ),

      drawer: CabDrawer(),

      ///
      //todo: (sdcsc)...................
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.17,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: size.height * 0.10,
                        decoration: BoxDecoration(
                          color: AppColors.textmaroon505,
                          //a13,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Mycrusial(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),
              InkWell(
                onTap: () {
                  ///Get.to(NewConnectionPage1());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
                  child: Container(
                    height: size.height * 0.055,
                    width: size.width,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      // border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        height: size.height * 0.055,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: MyTheme.linehome,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Your Driver:'.tr,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: size.width * 0.035,
                                      letterSpacing: 0.2,
                                      color: MyTheme.themecolor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    ' Rakesh Singh',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: size.width * 0.038,
                                      letterSpacing: 0.2,
                                      color: MyTheme.logored,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01),
                                child: HorizontalCircularButton(
                                  height: size.height * 0.037,
                                  width: size.width * 0.22,
                                  borderRadius: 7,
                                  fontSize: size.width * 0.037,
                                  text: "OTP:1234",

                                  onPressed: () {
                                    // if (_formKey.currentState!.validate()) {
                                    //   // If all fields are valid, toggle selection and navigate
                                    //   selectionController.toggleSelection(0);
                                    //Get.to(LoadChangeIncDec());
                                    // }
                                  },
                                  //isSelected: selectionController.selectedIndices.contains(0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              //Spacer(),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Services1.length, // Number of items in the grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 5, // Spacing between columns
                    mainAxisSpacing: 4,
                    mainAxisExtent: size.height * 0.177 // Spacing between rows
                    ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          //
                          ///Get.to(() => IndustryHighTension());
                          if (index == 0) {
                            //isLoading.value = true; // Set loading state to true
                            await _employeeGetProfileController
                                .employeeprofileApi();
                            await _updateProfileEmployeeController
                                .fetchStates();
                            await _employeegetprofile.employeeprofileApi();
                            CircularProgressIndicator();
                            await Get.to(ProfilePages());
                            // await FlutterPhoneDirectCaller.callNumber(
                            //     micccallnumber);
                            //
                            // makePhoneCall(
                            //     "123"); // Replace with the desired phone number
                            //Get.to(SelectPahseLineRange());
                            ///Get.to(() => FranchisesProfilePage());
                          } else if (index == 1) {
                            // await FlutterPhoneDirectCaller.callNumber(
                            // customercare);
                            //ContactUsUser
                            Get.to(() => ContactUsUser());

                            ///Get.to(() => support_page());
                          } else if (index == 2) {
                            /// _launchWhatsApp();
                            _showEmergencyDialog(context);
                            //Get.to(() => IndustryHighTension());
                          } else if (index == 3) {
                            //_launchUrl();

                            //Get.to(WebViewwebsitess(url: "$_url"));

                            //Get.to(() => IndustryHighTension());
                          }
                        },
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: PhysicalModel(
                              //elevation: 3,
                              shadowColor: MyTheme.signUpButtonColor,
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(17),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(17),
                                  child: Container(
                                    height: size.height * 0.09,
                                    width: size.width * 0.18,
                                    decoration: BoxDecoration(
                                      color: MyTheme.themecolor,
                                      //textmaroon505,
                                      //shape: BoxShape.circle
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        iconList1[index],
                                        size: size.height * 0.04,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                        //width: size.width * 0.145,
                        child: Center(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "${Services1[index]}".tr,
                              style: GoogleFonts.nunitoSans(
                                fontSize: size.height * 0.016,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),

              // InkWell(
              //   onTap: () {
              //     //Get.to(NewConnectionPage1());
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              //     child: Container(
              //       height: size.height * 0.044,
              //       width: size.width,
              //       decoration: BoxDecoration(
              //         //color: Colors.white,
              //         borderRadius: BorderRadius.circular(10),
              //         // border: Border.all(color: Colors.black, width: 2),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Container(
              //           height: size.height * 0.044,
              //           width: size.width,
              //           decoration: BoxDecoration(
              //             color: AppColors.a19,
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * 0.02),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Text(
              //                   'New Connection Services'.tr,
              //                   style: GoogleFonts.nunitoSans(
              //                     fontSize: size.width * 0.034,
              //                     letterSpacing: 0.2,
              //                     color: AppColors.a15,
              //                     fontWeight: FontWeight.w700,
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: size.width * 0.01),
              //                   child: Material(
              //                     elevation: 2,
              //                     // color: Colors.black12,
              //                     //shadowColor: Colors.grey.shade100,
              //                     borderRadius: BorderRadius.circular(100),
              //                     child: Container(
              //                       height: size.height * 0.04,
              //                       width: size.width * 0.08,
              //                       decoration: BoxDecoration(
              //                           shape: BoxShape.circle,
              //                           image: DecorationImage(
              //                               image: AssetImage(
              //                                   //'lib/assets/video/contact.gif'
              //                                   'lib/assets/video/right-arrow.gif'),
              //                               fit: BoxFit.fitWidth)),
              //                       // child: Image.asset('lib/assets/images/right-arrow.gif')
              //                     ),
              //                   ),
              //                   // Text(
              //                   //   'My Connection'.tr,
              //                   //   style: GoogleFonts.poppins(
              //                   //       fontSize: size.height * 0.015,
              //                   //       fontWeight: FontWeight.w600,
              //                   //       color: AppColors.a15),
              //                   // ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.0,
              ),
              // Container(
              //   height: size.height * 0.04,
              //   width: size.width,
              //   color: AppColors.white,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              //     child: Align(
              //       alignment: Alignment.center,
              //       child: Text(
              //         'Services for existing Consumers'.tr,
              //         style: GoogleFonts.poppins(
              //           color: Colors.black,
              //           fontWeight: FontWeight.w600,
              //           fontSize: size.width * 0.033,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.01,
              // ),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       'Billing & Payment Services'.tr,
              //       style: GoogleFonts.nunitoSans(
              //           fontSize: size.height * 0.015,
              //           color: AppColors.black,
              //           fontWeight: FontWeight.w700),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.00, vertical: size.height * 0.0),
                child: Container(
                  height: size.height * 0.043,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: MyTheme.linehome,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Our Services'.tr,
                        style: GoogleFonts.nunitoSans(
                            fontSize: size.height * 0.019,
                            color: MyTheme.themecolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.026,
              ),

              Container(
                // height: size.height * 0.14,
                width: size.width,
                //color: AppColors.th1wht3,

                // color: AppColors.newgray,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Services2.length, // Number of items in the grid
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      crossAxisSpacing: 5, // Spacing between columns
                      mainAxisSpacing: 4,
                      mainAxisExtent:
                          size.height * 0.177 // Spacing between rows
                      ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            //

                            if (index == 0) {
                              Get.to(() => MapTracking());

                              ///todo:

                              ///tod:........

                              // await FlutterPhoneDirectCaller.callNumber(
                              //     micccallnumber);
                              //
                              // makePhoneCall(
                              //     "123"); // Replace with the desired phone number
                              //Get.to(SelectPahseLineRange());

                              ///Get.to(() => FranchisesProfilePage());
                            } else if (index == 1) {
                              // await FlutterPhoneDirectCaller.callNumber(
                              // customercare);
                              //
                              // Show loading dialog
                              Get.dialog(
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                                barrierDismissible:
                                    false, // Prevent dismissing the dialog by tapping outside
                              );

                              try {
                                // Perform asynchronous operations
                                await tripformcontroller.fetchTripTypes();
                                await tripformcontroller.fetchShiftTypes();
                                await tripformcontroller.fetchPickupShiftTime();
                                await tripformcontroller.fetchDropShiftTime();
                                // Navigate to the next page after operations are complete
                                await Get.to(() => TripFormPage());

                                ///todo:.......................................
                              } finally {
                                // Dismiss the loading dialog
                                Get.back();
                              }

                              ///
                              // await tripformcontroller.fetchTripTypes();
                              // await tripformcontroller.fetchShiftTypes();
                              // await tripformcontroller.fetchPickupShiftTime();
                              // await tripformcontroller.fetchDropShiftTime();
                              //
                              // // final TripFormController tripformcontroller = Get.put(TripFormController());
                              //
                              // await Get.to(() => TripFormPage());
                            } else if (index == 2) {
                              ////_launchWhatsApp();
                              Get.to(() => ScheduleBookingTabbar());
                            } else if (index == 3) {
                              //_launchUrl();

                              //Get.to(WebViewwebsitess(url: "$_url"));

                              //Get.to(() => IndustryHighTension());
                            }
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: PhysicalModel(
                                //elevation: 3,
                                shadowColor: MyTheme.signUpButtonColor,
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(17),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(17),
                                    child: Container(
                                      height: size.height * 0.09,
                                      width: size.width * 0.18,
                                      decoration: BoxDecoration(
                                        color: MyTheme.themecolor,
                                        //textmaroon505,
                                        //shape: BoxShape.circle
                                        borderRadius: BorderRadius.circular(17),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          iconList2[index],
                                          size: size.height * 0.04,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                          //width: size.width * 0.145,
                          child: Center(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${Services2[index]}".tr,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: size.height * 0.016,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              // Divider(
              //   color: AppColors.a19,
              //   thickness: 10,
              // ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.00, vertical: size.height * 0.0),
                child: Container(
                  height: size.height * 0.043,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: MyTheme.linehome,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Our Testimonial'.tr,
                        style: GoogleFonts.nunitoSans(
                            fontSize: size.height * 0.019,
                            color: MyTheme.themecolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              Container(
                height: size.height * 0.145,
                width: size.width,
                decoration: BoxDecoration(
                    color: MyTheme.whitecolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))
                    //BorderRadius.circular(10),
                    ),

                //color: AppColors.th1wht3,

                // color: AppColors.newgray,
                child: ListView.builder(
                  itemCount: testimonials.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final testimonial = testimonials[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.14,
                              width: size.width * 0.16,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(testimonial.imageUrl),
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: size.height * 0.14,
                                width: size.width * 0.85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      testimonial.customerName,
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: size.height * 0.023,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.028,
                                      width: size.width * 0.85,
                                      child: Text(
                                        testimonial.description,
                                        style: GoogleFonts.nunitoSans(
                                          fontSize: size.height * 0.020,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greyColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 0.1),
                                    // Row(
                                    //   children: List.generate(5, (starIndex) {
                                    //     return Icon(
                                    //       starIndex < testimonial.rating
                                    //           ? Icons.star
                                    //           : Icons.star_border,
                                    //       color: Colors.amber,
                                    //     );
                                    //   }),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.0,
              ),

              SizedBox(
                height: size.height * 0.0,
              ),
              //Spacer(),
            ],
          ),
        ),
      ),
      //ttoo.....
      ///.......///.......///......///........///.......///.........
    );
  }
}

///.....///.....///......///.......///.......///.......///.......///........

class Mycrusial extends StatelessWidget {
  final _sliderKey = GlobalKey();
  Mycrusial({Key? key}) : super(key: key);
  //UserHomepageController _userHomepageController =
  // Get.put(UserHomepageController());
  final BannerController _controller = Get.put(BannerController());

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    //var imgpath = 'https://new.signatureresorts.in/Images/';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        //backgroundColor: Colors.redAccent,
        body: Obx(
      () => (_controller.isLoading.value)
          ? Center(child: CircularProgressIndicator())
          : _controller.bannerDriver!.data == null
              ? Center(
                  child: Text('No data'),
                )
              : Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    height: size.height * 0.20,
                    width: size.width,
                    decoration: BoxDecoration(
                      // color: AppColors.th1blue,
                      //textmaroon505,
                      //a12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Material(
                        // color: MyTheme.ThemeColors,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            //color: AppColors.textmaroon505,
                            //.a15,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: CarouselSlider.builder(
                            key: _sliderKey,
                            unlimitedMode: true,
                            autoSliderTransitionTime:
                                Duration(milliseconds: 500),
                            slideBuilder: (index) {
                              final items =
                                  //imageList;
                                  _controller.bannerDriver?.data;
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: Material(
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: size.height * 38,
                                    width: size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.a3,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${FixedText.imgebaseurlvardan}${_controller.bannerDriver!.data![index].bannerImage}"
                                                //'${items?[index]}' ?? ''
                                                ),
                                            fit: BoxFit.fill,
                                            onError: (error, stackTrace) {
                                              Text("No Image Found");
                                              // .log(error, stackTrace);
                                            })),
                                  ),
                                ),
                              );
                            },
                            slideTransform: DefaultTransform(),
                            slideIndicator: CircularSlideIndicator(
                              indicatorBorderWidth: 1,
                              indicatorRadius: 3,
                              itemSpacing: 15,
                              currentIndicatorColor: Colors.white,
                              indicatorBackgroundColor: Colors.grey.shade800,
                              padding: EdgeInsets.only(bottom: 0),
                            ),
                            itemCount: _controller.bannerDriver!.data!.length,
                            //imageList.length,
                            // _userHomepageController
                            //     .getuserbannerlist!.banner!.length,
                            enableAutoSlider: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
      // )
    ));
  }
}
