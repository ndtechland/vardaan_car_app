import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/buttons/horizontal_buttom.dart';
import '../../contantss/textfield_constant/textfield_reuse.dart';

class FeedbackDriver extends StatelessWidget {
  const FeedbackDriver({Key? key}) : super(key: key);

  // Function to launch URL

  // Function to handle WhatsApp launch

  // Function to show emergency confirmation dialog

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.whitecolor,
      appBar: myAppBar(
        backgroundColor: MyTheme.drivericon,
        title: 'Give Feedback',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add image before the first row
            Container(
              height: size.height * 0.28,
              width: size.width * 0.73,
              child: Image.asset(
                'assets/images/feedbackdvr.png',
                height: size.height * 0.43,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),

            Spacer(),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  height: size.height * 0.45,
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
                            'Give Feedback?',
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
                            'Name',
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
                          obscureText: false,
                          textColor: MyTheme.themecolor,
                          fieldColor: MyTheme.dvrskyblue6,
                          hintText: 'Enter Name',
                          keyboardType: TextInputType.text,
                          prefixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.red,
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
                            'Feedback',
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
                          maxLines: 3,
                          obscureText: false,
                          textColor: MyTheme.themecolor,
                          fieldColor: MyTheme.dvrskyblue6,
                          hintText: 'Enter Your Feedback',
                          keyboardType: TextInputType.text,
                          prefixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.question_mark_rounded,
                                  color: Colors.red,
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
                          Get.back();
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
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
