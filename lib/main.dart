import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'contantss/texts/language_text_string_change.dart';
import 'controller/language_controller.dart';
import 'module/driver/home_page_driver.dart';

Future<void> main() async {
  await GetStorage.init(); // Initialize GetStorage

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
}

// Override for handling self-signed certificates
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final LanguageController languageController = Get.put(LanguageController());

  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //locale: Get.deviceLocale,
        locale: Locale(languageController.selectedLocale.value),
        translations: AppTranslations(), // Your translations
        ///locale: Locale('en', 'US'), // Default locale
        fallbackLocale: Locale('en', 'US'),
        // Fallback locale

        title: 'Employee',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // You can customize more theme settings here if needed
        ),
        home:
            //EditProfilePages()
            //ProfilePages();
            //TranslateScreen(),

            //LanguagePagess(),
            ///HomePage()
            // Testtt()

            ///Testtt()

            ///GoogleLensLauncher(),

            /// SplashScreen(),
            HomePageDriver(),
      ),
    );
  }
}

///
///
///
