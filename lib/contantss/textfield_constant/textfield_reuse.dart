import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme_color/theme_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final String? prefixIconPath;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? maxLines; // Optional maxLines property
  final void Function(String)? onChanged; // Optional onChanged callback

  const CustomTextField({
    Key? key,
    this.controller,
    required this.obscureText,
    required this.hintText,
    required this.keyboardType,
    this.prefixIconPath,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.maxLines, // Include maxLines in the constructor
    this.onChanged, // Include onChanged in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: maxLines != null ? null : 50.0, // Adjust height based on maxLines
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: MyTheme.themecolor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        style: GoogleFonts.poppins(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        cursorHeight: height * 0.03,
        obscureText: obscureText,
        cursorColor: AppColors.white,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: onChanged, // Assign the onChanged callback

        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon ?? SizedBox(),
          suffixIcon: suffixIcon ?? SizedBox(),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
          ),
          contentPadding: const EdgeInsets.only(top: 13.0),
        ),
      ),
    );
  }
}
