import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/language_controller.dart';
import '../theme_color/theme_color.dart';
import 'home_page.dart';

class LanguageUpdatePagess extends StatelessWidget {
  LanguageUpdatePagess({Key? key}) : super(key: key);

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Change Language",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: size.width * 0.05,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: MyTheme.themecolor,
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    // Navigate to HomePage
                    Get.to(HomePage());
                  },
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.16,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [MyTheme.logored, MyTheme.whitecolor],
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
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.035,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1670979304099-63a993774c90?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'YourLanguages'.tr,
                              style: GoogleFonts.alegreya(
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.023,
                                color: Colors.white,
                                backgroundColor: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'language'.tr,
                              style: GoogleFonts.alegreya(
                                fontWeight: FontWeight.w800,
                                fontSize: size.height * 0.03,
                                color: Colors.redAccent,
                                backgroundColor: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
  {'locale': 'ml', 'label': 'മലയാളം'}, // Malayalam
  {'locale': 'kn', 'label': 'ಕನ್ನಡ'}, // Kannada
  {'locale': 'te', 'label': 'తెలుగు'}, // Telugu
  {'locale': 'mr', 'label': 'मराठी'}, // Marathi
  {'locale': 'ta', 'label': 'தமிழ்'}, // Tamil
  {'locale': 'or', 'label': 'ଓଡ଼ିଆ'}, // Odia
  {'locale': 'gu', 'label': 'ગુજરાતી'}, // Gujarati
  {'locale': 'pa', 'label': 'ਪੰਜਾਬੀ'}, // Punjabi
];
