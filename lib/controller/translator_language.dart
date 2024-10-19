// // lib/translation_controller.dart
//
// import 'package:get/get.dart';
// import 'package:translator/translator.dart';
//
// class TranslationController extends GetxController {
//   final translator = GoogleTranslator();
//
//   var translatedText = ''.obs;
//   var selectedLanguageCode = 'hi'.obs; // Default to Hindi
//
//   final List<Map<String, String>> languages = [
//     {'name': 'English', 'code': 'en'},
//     {'name': 'Hindi', 'code': 'hi'},
//     {'name': 'Bhojpuri', 'code': 'bho-IN'}, // Updated Bhojpuri code
//     {'name': 'Marathi', 'code': 'mr'},
//     {'name': 'Malayalam', 'code': 'ml'},
//     {'name': 'Telugu', 'code': 'te'},
//     {'name': 'Kannada', 'code': 'kn'},
//     {'name': 'Tamil', 'code': 'ta'},
//     {'name': 'Gujarati', 'code': 'gu'},
//     {
//       'name': 'Rajasthani',
//       'code': 'raj'
//     }, // Check for valid code for Rajasthani
//     {'name': 'Odiya', 'code': 'or'},
//   ];
//
//   final String staticText = 'Car'; // Static text to translate
//
//   void translate() async {
//     final translation =
//         await translator.translate(staticText, to: selectedLanguageCode.value);
//     translatedText.value = translation.text;
//   }
// }
