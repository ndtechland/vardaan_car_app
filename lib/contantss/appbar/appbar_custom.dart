import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme_color/theme_color.dart';

PreferredSizeWidget myAppBar({
  required String title,
  required IconData leadingIcon,
  required VoidCallback onLeadingPressed,
  IconData? searchIcon,
  VoidCallback? onSearchPressed,
  IconData? userIcon,
  VoidCallback? onUserPressed,
  bool? centerTitle,
  double? titleFontSize, // Added font size parameter
}) {
  return AppBar(
    backgroundColor: MyTheme.themecolor,
    title: Text(
      title,
      style: GoogleFonts.roboto(
        color: AppColors.white,
        fontSize:
            titleFontSize ?? 17, // Use provided font size or default to 17
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: centerTitle ?? true, // Center title by default
    leading: IconButton(
      icon: Icon(
        leadingIcon,
        size: 18,
      ),
      onPressed: onLeadingPressed,
      color: AppColors.white,
    ),
  );
}
