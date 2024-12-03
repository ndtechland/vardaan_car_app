import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/contact_us_controller.dart';
import '../theme_color/theme_color.dart';

// URLs
final Uri websiteUrl =
    Uri.parse('${_contactUsGetController.getContactUsModel?.data?.websiteUrl}');
final Uri emailUrl = Uri.parse(
    'mailto:${_contactUsGetController.getContactUsModel?.data?.emailId}?subject=This is a test email&body=This is a test email body');
final Uri _urlweb =
    Uri.parse('${_contactUsGetController.getContactUsModel?.data?.websiteUrl}');

Future<void> _launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

ContactUsGetController _contactUsGetController =
    Get.put(ContactUsGetController());

// Launch WhatsApp
_launchWhatsapp() async {
  var whatsapp =
      "${_contactUsGetController.getContactUsModel?.data?.employeeContactNumber}";
  var whatsappAndroid =
      Uri.parse("whatsapp://send?phone=$whatsapp&text=Hi Vardaan cabs");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    Get.snackbar(
      "WhatsApp not installed",
      "Please install WhatsApp",
      colorText: Colors.red.shade400,
      backgroundColor: Colors.white10,
      icon: Icon(Icons.person, color: Colors.red),
      snackPosition: SnackPosition.TOP,
    );
  }
}

// Launch Website
Future<void> _launchWebsite() async {
  if (!await launchUrl(websiteUrl, mode: LaunchMode.externalApplication)) {
    Get.snackbar(
      "Error",
      "Could not launch website",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}

// Launch Email
Future<void> _launchEmail() async {
  if (!await launchUrl(emailUrl)) {
    Get.snackbar(
      "Error",
      "Could not send email",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}

class support_page extends StatelessWidget {
  support_page({Key? key}) : super(key: key);

  ContactUsGetController _contactUsGetController =
      Get.put(ContactUsGetController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.th1whtbackgrd,
      body: Obx(
        () => (_contactUsGetController.isLoading.value)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(size),
                            SizedBox(height: size.height * 0.04),
                            buildText('Address:', size, true),
                            SizedBox(height: size.height * 0.03),
                            buildText('Registered Office:', size, true),
                            SizedBox(height: size.height * 0.005),
                            buildText(
                                "${_contactUsGetController.getContactUsModel?.data?.headOffice.toString()}",
                                size),
                            SizedBox(height: size.height * 0.03),
                            buildText('Corporate Office:', size, true),
                            SizedBox(height: size.height * 0.005),
                            buildText(
                                "${_contactUsGetController.getContactUsModel?.data?.branchOne.toString()}",
                                size),
                            SizedBox(height: size.height * 0.03),
                            buildContactSection(size),
                            SizedBox(height: size.height * 0.03),
                            buildEmailSection(size),
                            SizedBox(height: size.height * 0.03),
                            buildWebsiteSection(size),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: size.height * 0.03,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyTheme.themecolor,
              ),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: size.height * 0.022,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Text(
            'CONTACT SUPPORT',
            style: GoogleFonts.alatsi(
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.w600,
              color: AppColors.a15,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(String text, Size size, [bool isBold = false]) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: AppColors.a15,
        fontSize: size.width * 0.04,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
      ),
    );
  }

  Widget buildContactSection(Size size) {
    return Row(
      children: [
        buildText(
            'Contact :${_contactUsGetController.getContactUsModel?.data?.employeeContactNumber}',
            size,
            true),
        SizedBox(width: size.width * 0.03),
        InkWell(
          onTap: () {
            Get.defaultDialog(
              title: "Contact Us",
              confirm: buildButton(
                onTap: () async {
                  String telephoneNumber =
                      '${_contactUsGetController.getContactUsModel?.data?.employeeContactNumber}';
                  Uri telephoneUrl = Uri(scheme: 'tel', path: telephoneNumber);
                  if (await canLaunchUrl(telephoneUrl)) {
                    await launchUrl(telephoneUrl);
                  } else {
                    Get.snackbar("Error", "Could not place the call.");
                  }
                },
                text: 'Call',
                icon: Icons.phone,
                iconColor: Colors.green,
                size: size,
              ),
              cancel: buildButton(
                onTap: _launchWhatsapp,
                text: 'WhatsApp',
                icon: Icons.message,
                iconColor: Colors.green,
                size: size,
              ),
              middleText: "We are providing two options to contact us.",
              backgroundColor: AppColors.th1wht2,
              titleStyle: GoogleFonts.alatsi(
                color: AppColors.a15,
                fontSize: size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
              radius: 10,
            );
          },
          child: Container(
            height: size.height * 0.04,
            width: size.width * 0.08,
            decoration:
                BoxDecoration(color: Colors.white30, shape: BoxShape.circle),
            child: Icon(Icons.call, color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget buildEmailSection(Size size) {
    return Row(
      children: [
        buildText('Email:', size, true),
        InkWell(
          onTap: _launchEmail,
          child: Row(
            children: [
              Text(
                '${_contactUsGetController.getContactUsModel?.data?.emailId}',
                style: GoogleFonts.roboto(
                  color: AppColors.a15,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(width: size.width * 0.04),
              Icon(Icons.email, color: Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildWebsiteSection(Size size) {
    return Row(
      children: [
        buildText('Website:', size, true),
        InkWell(
          onTap: () {
            _launchURL(_urlweb);
          }
          //_launchURL(_urlweb); // Launch URL directly without navigating
          ,
          child: Row(
            children: [
              ///
              Text(
                '${_contactUsGetController.getContactUsModel?.data?.websiteUrl}',
                style: GoogleFonts.poppins(
                  color: AppColors.a15,
                  fontSize: size.width * 0.038,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),

              ///
              SizedBox(width: size.width * 0.02),
              InkWell(
                onTap: () {
                  _launchURL(_urlweb);
                },
                child: Icon(
                  Icons.language,
                  color: MyTheme.logored,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButton({
    required VoidCallback onTap,
    required String text,
    required IconData icon,
    required Color iconColor,
    required Size size,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size.height * 0.04,
          width: size.width * 0.26,

          ///....///......///......///...............
          child: Row(
            //...//....//.........//......//........//..........//.......
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: size.width * 0.05),
              SizedBox(width: size.width * 0.03),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.g1,
                  fontSize: size.width * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
