import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme_color/theme_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool obscureText;
  final String? prefixIconPath;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final void Function(String)? onChanged;
  final Color? fieldColor; // Optional fieldColor parameter
  final Color? textColor; // Optional textColor parameter

  const CustomTextField({
    Key? key,
    this.controller,
    this.obscureText = false, // Default value for obscureText
    this.hintText,
    this.keyboardType,
    this.prefixIconPath,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.maxLines = 1, // Default value for maxLines
    this.onChanged,
    this.fieldColor, // Include fieldColor in the constructor
    this.textColor, // Include textColor in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: maxLines != null && maxLines! > 1
          ? null
          : 50.0, // Adjust height based on maxLines
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: fieldColor ??
            MyTheme
                .themecolor, // Use provided fieldColor or default to MyTheme.themecolor
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        style: GoogleFonts.poppins(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: textColor ??
              Colors.white, // Use the provided textColor or default to white
        ),
        cursorHeight: height * 0.03,
        obscureText: obscureText,
        cursorColor: AppColors.white,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType ??
            TextInputType.text, // Default to text input type if not provided
        maxLines: maxLines, // Use maxLines or default to 1
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon ?? const SizedBox(),
          suffixIcon: suffixIcon ?? const SizedBox(),
          hintText:
              hintText ?? '', // Use an empty string if hintText is not provided
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
