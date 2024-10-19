import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  SpecialText({Key? key, required this.text}) : super(key: key);

  final String text;
  final wordPattern = RegExp(r'(\w+)');
  final digitPattern = RegExp(r'(\d+)');

  @override
  Widget build(BuildContext context) {
    // Filter out unwanted characters using a regular expression
    String filteredText = text.replaceAll(RegExp(r'[^\w\s.,!*\'), '');

    return Text(filteredText, style: TextStyle(fontWeight: FontWeight.bold));
  }
}
