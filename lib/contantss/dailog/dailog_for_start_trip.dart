import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../textfield_constant/textfield_reuse.dart';

class PickupDialog extends StatelessWidget {
  final PickupController controller = Get.put(PickupController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.lightBlue[100],
      contentPadding: EdgeInsets.all(12.0),
      content: Container(
        width: size.width * 0.7,
        constraints: BoxConstraints(
          maxHeight: size.height * 0.3, // Set a smaller height
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => controller.pickImage(),
              child: Obx(() {
                return CircleAvatar(
                  radius: 45, // Reduced radius for smaller avatar
                  backgroundColor: Colors.grey[300],
                  backgroundImage: controller.imagePath.value.isNotEmpty
                      ? FileImage(File(controller.imagePath.value))
                      : null,
                  child: controller.imagePath.value.isEmpty
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                      : null,
                );
              }),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Start Meter Reading',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            CustomTextField(
              obscureText: false,
              textColor: Colors.black,
              fieldColor: Colors.white,
              hintText: 'Meter Reading',
              keyboardType: TextInputType.number,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.catching_pokemon_rounded, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel', style: TextStyle(color: Colors.blue)),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
            controller.goToPickup();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyTheme.drivericon,
          ),
          child: Text('START'),
        ),
      ],
    );
  }
}

class PickupController extends GetxController {
  var imagePath = ''.obs;
  final TextEditingController otpController = TextEditingController();
  final TextEditingController meterReadingController = TextEditingController();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path;
    }
  }

  void goToPickup() {
    String otp = otpController.text;
    String meterReading = meterReadingController.text;
    print('OTP: $otp');
    print('Meter Reading: $meterReading');
  }
}
