import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThreeDtext extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow overflow;
  final Color? fontColor;
  final double? letterSpacing;
  final Color? shadowColor;
  // Make shadowColor optional
  final double? shadowBlurRadius;
  // Make letterSpacing optional
// Make fontColor optional by using Color?

  const ThreeDtext({
    Key? key,
    this.color = Colors.red,
    // Default color
    this.text = 'Click me!', // Default text
    this.fontSize = 16.0, // Default font size
    this.fontWeight = FontWeight.normal, // Default font weight
    this.maxLines = 1, // Default max lines
    this.overflow = TextOverflow.ellipsis, // Default overflow
    this.fontColor,
    this.letterSpacing,
    this.shadowColor, // Make shadowColor optional
    this.shadowBlurRadius,
    // Make letterSpacing optional
// Make fontColor optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor ?? Colors.black87,
          letterSpacing: letterSpacing,
          shadows: shadowColor != null &&
                  shadowBlurRadius !=
                      null // Check if both shadowColor and shadowBlurRadius are provided
              ? [
                  Shadow(
                    color: shadowColor!,
                    blurRadius: shadowBlurRadius!,
                    offset: Offset(1, 1),
                  ),
                ]
              : null, // If either shadowColor or shadowBlurRadius is not provided, don't apply shadow
        ),
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
