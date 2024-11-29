import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contantss/texts/language_text_string_change.dart';
import 'controller/language_controller.dart';
import 'module/splash_view.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(); // Initialize GetStorage
  // Initialize SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

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
            //EditProfilePages(),
            //ProfilePages();
            //TranslateScreen(),
            //LanguagePagess(),
            ///HomePage()
            // Testtt()
            ///Testtt()
            ///GoogleLensLauncher(),
            SplashScreen(),

        ///HomePageDriver(),

        ///HomePageDriver(),
      ),
    );
  }
}

///
///
///
////
///
// import 'dart:async';
// import 'dart:convert'; // For JSON encoding and decoding
//
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeService();
//   runApp(MyApp());
// }
//
// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//
//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       autoStart: true,
//       isForegroundMode: true,
//     ),
//     iosConfiguration: IosConfiguration(
//       autoStart: true,
//     ),
//   );
//
//   service.startService();
// }
//
// void onStart(ServiceInstance service) async {
//   if (service is AndroidServiceInstance) {
//     service.on('stopService').listen((event) {
//       service.stopSelf();
//     });
//   }
//
//   Timer.periodic(Duration(seconds: 10), (timer) async {
//     if (service is AndroidServiceInstance &&
//         !(await service.isForegroundService())) {
//       return;
//     }
//
//     Position? position;
//     try {
//       position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//     } catch (e) {
//       print("Error fetching location: $e");
//     }
//
//     if (position != null) {
//       final response = await updateEmployeeLocation(
//         position.latitude,
//         position.longitude,
//         5, // Replace with dynamic UserID if needed
//       );
//
//       if (response.statusCode == 200) {
//         print("Location updated successfully: ${response.body}");
//       } else {
//         print("Failed to update location: ${response.statusCode}");
//         print("Error Response: ${response.body}");
//       }
//     }
//   });
// }
//
// Future<http.Response> updateEmployeeLocation(
//     double latitude, double longitude, int userId) async {
//   final url = Uri.parse(
//       'https://api.ndtechland.com/api/EmployeeApi/UpdateEmployeeLocation');
//   final headers = {'Content-Type': 'application/json'};
//   final body = jsonEncode({
//     "CurrentLat": latitude.toString(),
//     "Currentlong": longitude.toString(),
//     "Userid": userId,
//   });
//
//   try {
//     final response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );
//
//     // Log response for debugging
//     print("Request Sent: $body");
//     print("Response Status: ${response.statusCode}");
//     print("Response Body: ${response.body}");
//
//     return response;
//   } catch (e) {
//     print("HTTP Request failed: $e");
//     rethrow; // Propagate the error for further handling
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Background Location Update")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 final isRunning = await FlutterBackgroundService().isRunning();
//                 if (isRunning) {
//                   // Stop the service using stop() method
//                   /// await FlutterBackgroundService().stopService();
//                   print("Service stopped");
//                 } else {
//                   await FlutterBackgroundService().startService();
//                   print("Service started");
//                 }
//               },
//               child: Text("Toggle Service"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
