// // lib/translate_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/translator_language.dart';
//
// class TranslateScreen extends StatelessWidget {
//   final TranslationController translationController =
//       Get.put(TranslationController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Google Translator')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Static Text: ${translationController.staticText}', // Display static text
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//             // Dropdown for language selection
//             Obx(() {
//               return DropdownButton<String>(
//                 value: translationController.selectedLanguageCode.value,
//                 onChanged: (String? newValue) {
//                   translationController.selectedLanguageCode.value = newValue!;
//                 },
//                 items: translationController.languages
//                     .map<DropdownMenuItem<String>>((Map<String, String> lang) {
//                   return DropdownMenuItem<String>(
//                     value: lang['code'],
//                     child: Text(lang['name']!),
//                   );
//                 }).toList(),
//               );
//             }),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 translationController.translate(); // Call translate method
//               },
//               child: Text('Translate'),
//             ),
//             SizedBox(height: 16),
//             Obx(() {
//               return Text(
//                 'Translated Text: ${translationController.translatedText.value}',
//                 style: TextStyle(fontSize: 24),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
