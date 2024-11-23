import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vardaancar/module/driver/drower_driver.dart';
import 'package:vardaancar/module/driver/profile_details_page.dart';
import 'package:vardaancar/module/driver/report_payments.dart';
import 'package:vardaancar/module/driver/requested_user_list.dart';
import 'package:vardaancar/module/driver/review_rating_list.dart';
import 'package:vardaancar/module/driver/scheduled_booking_cab.dart';
import 'package:vardaancar/module/driver/support_driver.dart';
import 'package:vardaancar/module/driver/track_user_list.dart';

import '../../contantss/fixed_text_for_api.dart';
import '../../contantss/texts/3d_texts.dart';
import '../../controller/driver_controller/diver_banner_get_controller.dart';
import '../../controller/driver_controller/switch_controller.dart';
import '../../theme_color/theme_color.dart';
import 'Booking_history_driver.dart';
import 'driver_toggle_homepage.dart';

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

List<String> Services2 = [
  'User\'s Request',
  'Track User',
  'Scheduled',
];

List<String> Services3 = [
  'Report',
  'History',
  'Review',
  //'Consumer Grievance',
];

List<IconData> iconList1 = [
  Icons.manage_accounts_rounded,
  //change_circle_rounded,
  //data_usage_rounded,
  Icons.question_mark_sharp,
  //contact_phone,
  Icons.warning_rounded,
  //Icons.report_problem,
  // Icons.settings,
];

List<IconData> iconList2 = [
  Icons.catching_pokemon_rounded,
  Icons.gps_fixed_outlined,
  Icons.safety_check_sharp
  //punch_clock_outlined
  //repeat_sharp,
  // Icons.settings,
];
List<IconData> iconList3 = [
  Icons.list_alt,
  Icons.history,
  Icons.feedback_rounded
  //repeat_sharp,
  // Icons.settings,
];

List<String> imageList = [
  'https://plus.unsplash.com/premium_photo-1661714065634-e6430d1f2ff7?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1661265896883-7c7fb253f611?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1683140697708-bbbea490f52d?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1682091481266-07851df944a9?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  // 'https://images.unsplash.com/photo-1600320254374-ce2d293c324e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3DD',
  // 'https://plus.unsplash.com/premium_photo-1661637975458-5359c6ff9ada?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //'https://plus.unsplash.com/premium_photo-1661306636048-5dfa19532575?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //'https://plus.unsplash.com/premium_photo-1661384269050-e5886bf33f6a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //'https://plus.unsplash.com/premium_photo-1661277663422-26a6fe569350?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
];

class HomePageDriver extends StatelessWidget {
  final SwitchController switchController = Get.put(SwitchController());

  final List<Testimonial> testimonials = [
    Testimonial(
        customerName: 'Kumar Prince',
        description: 'Great Service! Very satisfied with the quality.',
        rating: 5,
        imageUrl:
            'https://images.unsplash.com/photo-1640951613773-54706e06851d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
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
  HomePageDriver({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _key = new GlobalKey();
  String micccallnumber = "7666008833";
  String customercare = "1912";
  final Uri _url = Uri.parse('https://vardaancab.com');

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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  //

  // Function to show emergency confirmation dialog
  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyTheme.dvrskyblue6,
          //Colors.red[50], // Light red background for emergency
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
            'Are you sure you want to make an emergency call to 9877889923?',
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
                _launchURL('tel:9911879555');
              },
            ),
          ],
        );
      },
    );
  }

// Dialog Function

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
        backgroundColor: MyTheme.dvrskyblue7,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              /// Get.to(LoginEmailPage());
              _key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: MyTheme.drivericon,
            )),

        ///
        title: ThreeDtext(
          text: 'Vardaan Driver'.tr,
          fontColor: MyTheme.dvrskyblueshad2,
          //textmaroon505,
          fontSize: size.height * 0.028,
          fontWeight: FontWeight.w700,
          color: MyTheme.dvrskyblue8,
          letterSpacing: 1,
          shadowColor: MyTheme.themecolor,
          shadowBlurRadius: 3.0,
        ),
        // Container(
        //   height: size.height * 0.05,
        //   width: size.width * 0.2,
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('lib/assets/video/suvidha33logo.jpeg'))),
        actions: [
          DriverToggleButton(
            isSwitchOn: switchController.isSwitchOn,
            onConfirm: (bool newState) {
              switchController.isSwitchOn.value = newState;
            },
          ),
        ],

        //Text("Suvidha"),
      ),

      drawer: CabDriverDrawer(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.19,
                width: size.width,
                decoration: BoxDecoration(
                  color: MyTheme.dvrskyblue8,
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
                        height: size.height * 0.14,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          //a13,
                          //
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
              // InkWell(
              //   onTap: () {
              //     ///Get.to(NewConnectionPage1());
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
              //     child: Container(
              //       height: size.height * 0.055,
              //       width: size.width,
              //       decoration: BoxDecoration(
              //         //color: Colors.white,
              //         borderRadius: BorderRadius.circular(5),
              //         // border: Border.all(color: Colors.black, width: 2),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Container(
              //           height: size.height * 0.055,
              //           width: size.width,
              //           decoration: BoxDecoration(
              //             color: MyTheme.linehome,
              //             borderRadius: BorderRadius.circular(5),
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * 0.02),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Text(
              //                       'Your Driver:'.tr,
              //                       style: GoogleFonts.nunitoSans(
              //                         fontSize: size.width * 0.035,
              //                         letterSpacing: 0.2,
              //                         color: MyTheme.themecolor,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     ),
              //                     Text(
              //                       ' Rakesh Singh',
              //                       style: GoogleFonts.nunitoSans(
              //                         fontSize: size.width * 0.038,
              //                         letterSpacing: 0.2,
              //                         color: MyTheme.logored,
              //                         fontWeight: FontWeight.w800,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: size.width * 0.01),
              //                   child: HorizontalCircularButton(
              //                     height: size.height * 0.037,
              //                     width: size.width * 0.22,
              //                     borderRadius: 7,
              //                     fontSize: size.width * 0.037,
              //                     text: "OTP:1234",
              //
              //                     onPressed: () {
              //                       // if (_formKey.currentState!.validate()) {
              //                       //   // If all fields are valid, toggle selection and navigate
              //                       //   selectionController.toggleSelection(0);
              //                       //Get.to(LoadChangeIncDec());
              //                       // }
              //                     },
              //                     //isSelected: selectionController.selectedIndices.contains(0),
              //                   ),
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
                            Get.to(() => ProfilePagesDriver());
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
                            Get.to(() => ContactUs());
                          } else if (index == 2) {
                            _showEmergencyDialog(
                                context); // Show emergency confirmation dialog

                            /// _launchWhatsApp();
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
                              elevation: 5,
                              shadowColor: MyTheme.dvrskyblueshad1,
                              color: MyTheme.drivertheme,
                              borderRadius: BorderRadius.circular(17),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(17),
                                  child: Container(
                                    height: size.height * 0.09,
                                    width: size.width * 0.18,
                                    decoration: BoxDecoration(
                                      color: MyTheme.drivertheme,
                                      //textmaroon505,
                                      //shape: BoxShape.circle
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        iconList1[index],
                                        size: size.height * 0.036,
                                        color: MyTheme.ThemeColors,
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
                    color: MyTheme.linedriverdivider,
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
                              //ReqestUserList
                              Get.to(() => ReqestUserList());

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
                              Get.to(() => TrackUserList());
                            } else if (index == 2) {
                              Get.to(() => ScheduledBookingUser());

                              ////_launchWhatsApp();
                              // Get.to(() => ScheduleBookingTabbar());
                            } else if (index == 3) {
                              //_launchUrl();

                              //Get.to(WebViewwebsitess(url: "$_url"));
                            }
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: PhysicalModel(
                                //elevation: 3,
                                elevation: 5,
                                shadowColor: MyTheme.dvrskyblueshad1,
                                color: MyTheme.drivertheme,
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
                                        color: MyTheme.drivertheme,
                                        //textmaroon505,
                                        //shape: BoxShape.circle
                                        borderRadius: BorderRadius.circular(17),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          iconList2[index],
                                          size: size.height * 0.036,
                                          color: MyTheme.themecolor,
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
                    color: MyTheme.linedriverdivider,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Others'.tr,
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
                height: size.height * 0.03,
              ),

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
                            Get.to(() => ReportPayment());

                            //Get.to(ProfilePages());
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
                            Get.to(() => HistoryBookingTabbarDriver());
                          } else if (index == 2) {
                            Get.to(() => ReviewRatingList());

                            //ReviewRatingList
                            /// _launchWhatsApp();
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
                              elevation: 5,
                              shadowColor: MyTheme.dvrskyblueshad1,
                              color: MyTheme.drivertheme,
                              borderRadius: BorderRadius.circular(17),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(17),
                                  child: Container(
                                    height: size.height * 0.09,
                                    width: size.width * 0.18,
                                    decoration: BoxDecoration(
                                      color: MyTheme.drivertheme,
                                      //textmaroon505,
                                      //shape: BoxShape.circle
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        iconList3[index],
                                        size: size.height * 0.036,
                                        color: MyTheme.ThemeColors,
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
                              "${Services3[index]}".tr,
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
    );
  }
}

class Mycrusial extends StatelessWidget {
  final _sliderKey = GlobalKey();
  final BannerController _bannerController = Get.put(BannerController());

  Mycrusial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Fetch banners for the role "Driver"
    _bannerController.BannersApi();

    return Scaffold(
      body: Obx(() {
        if (_bannerController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_bannerController.bannerDriver!.data!.isEmpty) {
          return Center(child: Text("No banners available"));
        }

        return Padding(
          padding: EdgeInsets.all(0.0),
          child: Container(
            height: size.height * 0.23,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CarouselSlider.builder(
                    key: _sliderKey,
                    unlimitedMode: true,
                    autoSliderTransitionTime: Duration(milliseconds: 500),
                    slideBuilder: (index) {
                      // final imgpath = 'https://new.signatureresorts.in/Images/';
                      final bannerImage =
                          "${FixedText.imgebaseurlvardan}${_bannerController.bannerDriver!.data![index].bannerImage}";
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Material(
                          elevation: 12,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: size.height * 0.40,
                            width: size.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: 1),
                              image: DecorationImage(
                                image: NetworkImage(bannerImage),
                                fit: BoxFit.fill,
                                onError: (error, stackTrace) {
                                  print('Image Load Error: $error');
                                },
                              ),
                            ),
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
                    itemCount: _bannerController.bannerDriver!.data!.length,
                    enableAutoSlider: true,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

void _showPowerDialog(BuildContext context, SwitchController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm"),
        content: Text("Do you want to enable the switch?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              controller.changeSwitchStateFromDialog();
              Navigator.of(context).pop();
            },
            child: Text("Yes"),
          ),
        ],
      );
    },
  );
}
