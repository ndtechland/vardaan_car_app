import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThreeDtext2 extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow overflow;
  final Color fontColor;
  final double? letterSpacing; // Make letterSpacing optional

  const ThreeDtext2({
    Key? key,
    this.color = Colors.red, // Default color
    this.text = 'Click me!', // Default text
    this.fontSize = 16.0, // Default font size
    this.fontWeight = FontWeight.normal, // Default font weight
    this.maxLines = 1, // Default max lines
    this.overflow = TextOverflow.ellipsis, // Default overflow
    this.fontColor = Colors.black87,
    this.letterSpacing, // Make letterSpacing optional
// Default font color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor, // Use fontColor parameter here
          shadows: [
            Shadow(
              color: Colors.black45,
              blurRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
