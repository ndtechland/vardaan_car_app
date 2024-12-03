import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/buttons/horizontal_buttom.dart';
import '../../contantss/textfield_constant/textfield_reuse.dart';
import '../../controller/contact_us_controller.dart';
import '../../controller/employee_controllers/help_employee_controller.dart';

class ContactUsUser extends StatelessWidget {
  ContactUsUser({Key? key}) : super(key: key);

  ContactUsGetController _contactUsGetController =
      Get.put(ContactUsGetController());

  // Function to launch URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  HelpEmployeeController _helpEmployeeController =
      Get.put(HelpEmployeeController());

  // Function to handle WhatsApp launch

  Future<void> _launchWhatsApp() async {
    final phoneNumber = _contactUsGetController
        .getContactUsModel?.data?.employeeContactNumber; // WhatsApp number
    if (phoneNumber == null || phoneNumber.isEmpty) {
      Get.snackbar('Error', 'Contact number not available.');
      return;
    }

    final whatsappUrl = 'https://wa.me/$phoneNumber';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      Get.snackbar('Error', 'Could not launch WhatsApp.');
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: '${_contactUsGetController.getContactUsModel?.data?.emailId}',
      queryParameters: {
        'subject': 'Support Request',
        'body': 'Hello, I need help with...', // Customize your email body
      },
    );

    try {
      // Using launchUrl method..................
      if (await launchUrl(emailLaunchUri)) {
        // Email client launched successfully
      } else {
        Get.snackbar('Error',
            'Could not launch email client. Please check if an email app is installed.');
      }
    } catch (e) {
      print(
          'Error launching email client: $e'); // Print the error for debugging
      Get.snackbar('Error',
          'An unexpected error occurred while trying to launch the email client.');
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
      backgroundColor: MyTheme.whitecolor,
      appBar: myAppBar(
        backgroundColor: MyTheme.themecolor,
        title: 'Help',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
        actionIcon: Icons.emergency,
        onActionPressed: () {
          _showEmergencyDialog(context); // Show emergency confirmation dialog
        },
      ),
      body: Obx(
        () => _helpEmployeeController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _helpEmployeeController.helpemployeeFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [
                      // Add image before the first row
                      Container(
                        height: size.height * 0.25,
                        width: size.width * 0.73,
                        child: Image.asset(
                          'assets/images/supportdriver.png',
                          height: size.height * 0.33,
                          width: size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Call Now Button
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => _launchURL(
                                    'tel:${_contactUsGetController.getContactUsModel?.data?.employeeContactNumber}'),
                                child: Container(
                                  height: size.height * 0.12,
                                  width: size.width * 0.29,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.height * 0.06,
                                          width: size.width * 0.16,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red.shade100,
                                          ),
                                          child: Icon(
                                            Icons.call,
                                            color: MyTheme.logored,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Call Now",
                                        style: GoogleFonts.poppins(
                                          fontSize: size.height * 0.015,
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme.logored,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Email Us Button
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => _launchEmail(),
                                //_launchURL('mailto:ndtechland@gmail.com'),
                                child: Container(
                                  height: size.height * 0.12,
                                  width: size.width * 0.29,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.height * 0.06,
                                          width: size.width * 0.16,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.purple.shade100,
                                          ),
                                          child: Icon(
                                            Icons.email,
                                            color: Colors.purple.shade900,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Email Us",
                                        style: GoogleFonts.poppins(
                                          fontSize: size.height * 0.015,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.purple.shade900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // WhatsApp Chat Button
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: _launchWhatsApp,
                                child: Container(
                                  height: size.height * 0.12,
                                  width: size.width * 0.29,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.height * 0.06,
                                          width: size.width * 0.16,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green.shade100,
                                          ),
                                          child: Icon(
                                            Icons.chat,
                                            color: Colors.green.shade900,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Chat Now",
                                        style: GoogleFonts.poppins(
                                          fontSize: size.height * 0.015,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green.shade900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      // Spacer(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            height: size.height * 0.49,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: size.height * 0.01),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.05),
                                    child: Text(
                                      'Quick Help?',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.width * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.05),
                                    child: Text(
                                      'Phone',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.width * 0.027,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: CustomTextField(
                                    controller: _helpEmployeeController
                                        .passwordController1,
                                    obscureText: false,
                                    textColor: MyTheme.whitecolor,
                                    fieldColor: MyTheme.themecolor,
                                    hintText: 'Enter Phone',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter
                                          .digitsOnly, // Restrict input to digits
                                      LengthLimitingTextInputFormatter(
                                          10), // Restrict to 10 digits max
                                    ],
                                    prefixIcon: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Icon(
                                            Icons.phone_android_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.05),
                                    child: Text(
                                      'Reason',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: size.width * 0.027,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.005),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: CustomTextField(
                                    controller: _helpEmployeeController
                                        .passwordController2,
                                    maxLines: 3,
                                    obscureText: false,
                                    textColor: MyTheme.whitecolor,
                                    fieldColor: MyTheme.themecolor,
                                    hintText: 'Give Reason',
                                    keyboardType: TextInputType.text,
                                    prefixIcon: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Icon(
                                            Icons.question_mark_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                HorizontalButton(
                                  text: 'Submit',
                                  onClick: () {
                                    if (_helpEmployeeController
                                            .helpemployeeFormKey.currentState
                                            ?.validate() ??
                                        false) {
                                      _helpEmployeeController
                                          .checkHelp(context);
                                    }
                                    ;
                                    // Validate phone number

                                    //Get.back();
                                    print('Submit clicked!');
                                  },
                                ),
                                // SizedBox(height: size.height * 0.042),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
