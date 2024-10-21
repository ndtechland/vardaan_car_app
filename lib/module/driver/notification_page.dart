import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../theme_color/theme_color.dart';

class driver_notification extends StatelessWidget {
  //final CustomSwitchController controller = Get.put(CustomSwitchController());

  driver_notification({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.th1whtbackgrd,
      appBar: myAppBar(
        backgroundColor: MyTheme.orng7,
        title: 'Notifications',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
          // Handle leading icon press
        },
        searchIcon: null,
        onSearchPressed: () {
          // Handle search icon press
        },
        userIcon: null,
        onUserPressed: () {
          // Handle user icon press
        },
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),

            ///Spacer(),
            SizedBox(
              height: size.height * 0.01,
            ),
            //Customized
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.005),
              child: PhysicalModel(
                color: AppColors.a1,
                borderRadius: BorderRadius.circular(10),
                shadowColor: AppColors.a5,
                elevation: 2,
                child: Container(
                  height: size.height * 0.075,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.th1wht2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                      // height: size.height * 0.06,
                      //width: size.width * 0.55ss
                      child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your user is waiting for you.',
                          style: GoogleFonts.roboto(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.005),
              child: PhysicalModel(
                color: AppColors.a1,
                borderRadius: BorderRadius.circular(10),
                shadowColor: AppColors.a5,
                elevation: 2,
                child: Container(
                  height: size.height * 0.075,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.th1wht2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                      // height: size.height * 0.06,
                      //width: size.width * 0.55,
                      child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your user  name is Kumar jee.',
                          style: GoogleFonts.roboto(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.005),
              child: PhysicalModel(
                color: AppColors.a1,
                borderRadius: BorderRadius.circular(10),
                shadowColor: AppColors.a5,
                elevation: 2,
                child: Container(
                  height: size.height * 0.075,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.th1wht2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                      // height: size.height * 0.06,
                      //width: size.width * 0.55,
                      child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your user is waiting from  10 minutes.',
                          style: GoogleFonts.roboto(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.005),
              child: PhysicalModel(
                color: AppColors.a1,
                borderRadius: BorderRadius.circular(10),
                shadowColor: AppColors.a5,
                elevation: 2,
                child: Container(
                  height: size.height * 0.075,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.th1wht2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                      // height: size.height * 0.06,
                      //width: size.width * 0.55,
                      child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "You have finished our ride.",
                          style: GoogleFonts.roboto(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.005),
              child: PhysicalModel(
                color: AppColors.a1,
                borderRadius: BorderRadius.circular(10),
                shadowColor: AppColors.a5,
                elevation: 2,
                child: Container(
                  height: size.height * 0.075,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.th1wht2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                      // height: size.height * 0.06,
                      //width: size.width * 0.55,
                      child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your user is Rejected your trip due to not well',
                          style: GoogleFonts.roboto(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ),
            // Text('Switch 1 State: ${controller.switchState}'),
            // CustomSwitch(controller: controller),
            // SizedBox(height: 20),
            // Text('Switch 2 State: ${controller.switchState}'),
            // CustomSwitch(controller: controller),
            // SizedBox(height: 20),
            // Text('Switch 3 State: ${controller.switchState}'),
            // CustomSwitch(controller: controller),
          ],
        ),
      ),
    );
  }
}
