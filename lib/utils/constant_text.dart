import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme_color/theme_color.dart';

class ThreeDTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const ThreeDTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 3D Title
        Stack(
          children: [
            // Shadow effect for 3D appearance
            Text(
              title,
              style: GoogleFonts.oswald(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,

                color: MyTheme.themecolor, // Main title color
              ),
            ),
            // Main title
            Text(
              title,
              style: GoogleFonts.oswald(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: MyTheme.themecolor, // Main title color
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 5), // Spacing between title and subtitle
        // Subtitle
        Text(
          subtitle,
          style: GoogleFonts.alegreya(
            fontSize: 16,
            color: Colors.grey, // Subtitle color
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
