import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../../controller/language_controller.dart';

class LanguageButton extends StatelessWidget {
  final String locale;
  final String label;

  const LanguageButton({
    Key? key,
    required this.locale,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (controller) {
        bool isSelected = controller.selectedLocale == locale;

        return InkWell(
          onTap: () {
            controller.updateLocale(locale);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:
                  size.height * 0.07, // Adjust height relative to screen size
              width: size.width * 0.4, // Adjust width relative to screen size
              decoration: BoxDecoration(
                color: isSelected ? MyTheme.themecolor : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: isSelected ? MyTheme.logored : Colors.grey,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize:
                        size.width * 0.045, // Font size scales with screen
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
