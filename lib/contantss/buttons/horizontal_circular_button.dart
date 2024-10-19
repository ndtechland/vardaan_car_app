import 'package:flutter/material.dart';

import '../../theme_color/theme_color.dart';

class HorizontalCircularButton extends StatefulWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback? onPressed;
  final double borderRadius; // New parameter for border radius
  final Color? textColor; // New parameter for text color, optional
  final double? fontSize; // New parameter for font size, optional

  const HorizontalCircularButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.onPressed,
    this.borderRadius = 10, // Default border radius
    this.textColor, // Text color, optional
    this.fontSize, // Font size, optio
  }) : super(key: key);

  @override
  _HorizontalCircularButtonState createState() =>
      _HorizontalCircularButtonState();
}

class _HorizontalCircularButtonState extends State<HorizontalCircularButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Size size = MediaQuery.of(context).size;
    final double defaultFontSize = size.width * 0.039;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          // gradient: AppColors.gradient5,
          color: MyTheme.logored,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.3),
                    blurRadius: 1.0,
                    spreadRadius: 5.0,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 2.0,
                    spreadRadius: 5.0,
                  ),
                ],
        ),
        child: Center(
          child: Transform.scale(
            scale: _isPressed ? 0.95 : 1.0,
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor ?? AppColors.whiteColor,
                fontSize: widget.fontSize ?? defaultFontSize,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    blurRadius: 0,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
