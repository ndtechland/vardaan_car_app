import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/buttons/horizontal_circular_button.dart';
import '../../contantss/textfield_constant/textfield_reuse.dart';
import '../../theme_color/theme_color.dart';

class FeedbackScreen extends StatelessWidget {
  final GlobalKey<FormState> _formconnectionfedbackKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.th1whtbackgrd,
      appBar: myAppBar(
        //backgroundColor: AppColors.white,
        title: 'Feedback Screen',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();

          // Handle leading icon press
        },
        searchIcon: null,
        onSearchPressed: () {
          // Handle search icon press
        },
        userIcon: null,
        onUserPressed: () {
          // Handle user icon press
        },
      ),
      body: SafeArea(
        child: Form(
          key: _formconnectionfedbackKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Text(
                    """I value your insights and would love to hear your thoughts on how I’m doing. Your feedback is important to me and will help me grow and improve."""
                    //"""I'd really appreciate if I could get your feedback on my performance. I want to improve, and I know your feedback will help me do that.""",
                    ,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.03,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              SizedBox(height: size.height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    'Enter Your Feedback.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextField(
                  maxLines: 9,
                  obscureText: false,
                  hintText: 'Enter Feedback',
                  keyboardType: TextInputType.name,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter a phone number';
                  //   } else if (value.length != 5) {
                  //     return 'Phone number must be 10 digits long';
                  //   }
                  //   return null;
                  // },
                  //suffixIcon: Icon(Icons.remove_red_eye_outlined),

                  // prefixIcon: Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //       child: Icon(
                  //         Icons.person,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //
                  //     ///
                  //     // Text(
                  //     //   '+91 ',
                  //     //   style: GoogleFonts.poppins(
                  //     //     fontSize: 15.0,
                  //     //     fontWeight: FontWeight.w500,
                  //     //     color: Colors.black, // Added text color
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  // Icon(
                  //   Icons.phone_android_outlined,
                  //   color: Colors.black,
                  // ),
                ),
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              HorizontalCircularButton(
                height: size.height * 0.045,
                width: size.width * 0.4,
                text: "SEND",
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   // If all fields are valid, toggle selection and navigate
                  //   selectionController.toggleSelection(0);
                  /// Get.to(LoadChangeIncDec());
                  // }
                },
                //isSelected: selectionController.selectedIndices.contains(0),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     Get.to(Verifyotp2());
              //     // if (_formconnectionKey.currentState!.validate()) {
              //     //   // Form is valid, proceed with submission
              //     //   // You can access the form fields' values using _formKey.currentState!.value
              //     // }
              //     // Handle form submission
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: AppColors.a15, // Change the button color here
              //     onPrimary: Colors.white, // Change the text color here
              //     minimumSize: Size(double.infinity,
              //         50), // Change the button height and width here
              //     padding: EdgeInsets.symmetric(
              //         vertical: 16.0), // Adjust vertical padding as needed
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(
              //           0), // Adjust border radius as needed
              //     ),
              //   ),
              //   child: Text(
              //     'Verify OTP',
              //     style: GoogleFonts.poppins(
              //       fontWeight: FontWeight.w600,
              //       fontSize: size.width * 0.041,
              //     ),
              //   ),
              // ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                height: size.height * 0.005,
              ),
              // HorizontalButton
              // HorizontalButton(
              //   text: 'Verify OTP',
              //   onClick: () {
              //     Get.to(Verifyotp2());
              //     // Your onClick logic here
              //     print('Container clicked!');
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
