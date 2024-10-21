import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/language_controller.dart';
import '../../theme_color/theme_color.dart';
import 'home_page.dart';

class LanguagePagess extends StatelessWidget {
  LanguagePagess({Key? key}) : super(key: key);
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1670979304099-63a993774c90?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                    //'https://images.unsplash.com/photo-1692037352067-289584aaf445?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                    // "https://images.unsplash.com/photo-1529310399831-ed472b81d589?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ,
                  ),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black45, BlendMode.darken), // Dim the image
                ),
              ),
            ),
            // Content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    // Header Text
                    SizedBox(height: 40),
                    // Header Text
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.black,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 10),

                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'YourLanguages'.tr,
                              style: GoogleFonts.alegreya(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height *
                                    0.023, // Keeps the base font size responsive
                                color: Colors.white,
                                backgroundColor: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                        //const SizedBox(width: 5),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'language'.tr,
                              style: GoogleFonts.alegreya(
                                fontWeight: FontWeight.w800,
                                fontSize: size.height *
                                    0.03, // Keeps the base font size responsive
                                color: Colors.redAccent,
                                backgroundColor: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    // Grid of Language Buttons
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: _languages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio: 3 / 1.5,
                        ),
                        itemBuilder: (context, index) {
                          String locale = _languages[index]['locale']!;
                          String label = _languages[index]['label']!;
                          return Obx(() => GestureDetector(
                                onTap: () {
                                  // Update the selected language when clicked
                                  languageController.updateLocale(locale);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: languageController
                                                  .selectedLocale.value ==
                                              locale
                                          ? Colors.red
                                          : Colors.grey,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: languageController
                                                .selectedLocale.value ==
                                            locale
                                        ? MyTheme.themecolor
                                        : Colors.white,
                                    //Colors.white.withOpacity(0.7),
                                  ),
                                  child: Text(
                                    label,
                                    style: GoogleFonts.poppins(
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.w600,
                                      color: languageController
                                                  .selectedLocale.value ==
                                              locale
                                          ? MyTheme.whitecolor
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                    // Save Button
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.to(HomePage());
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [MyTheme.themecolor, MyTheme.logored],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "SAVE",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.045,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// List of languages
final List<Map<String, String>> _languages = [
  {'locale': 'en', 'label': 'English'},
  {'locale': 'hi', 'label': 'हिन्दी'},
  {'locale': 'ml', 'label': 'മലയാളം'}, //malyalam
  {'locale': 'kn', 'label': 'ಕನ್ನಡ'}, //kannada
  {'locale': 'te', 'label': 'తెలుగు'}, //telugu
  {'locale': 'mr', 'label': 'मराठी'}, //marathi
  {'locale': 'ta', 'label': 'தமிழ்'}, //tamil
  {'locale': 'or', 'label': 'ଓଡ଼ିଆ'}, //odiya
  {'locale': 'gu', 'label': 'ગુજરાતી'}, // Gujarati added
  {'locale': 'pa', 'label': 'ਪੰਜਾਬੀ'}, //punjabi
];
