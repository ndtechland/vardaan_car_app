import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/module/user/scheduled_bookin_upcoming.dart';
import 'package:vardaancar/module/user/scheduled_live_booking.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../theme_color/theme_color.dart';

//import '../../constants/reusable_appbar/reusable_appbar.dart';

class ScheduleBookingTabbar extends StatelessWidget {
  ScheduleBookingTabbar({Key? key}) : super(key: key);

  // NavBarController _navcontroller =
  // Get.put(NavBarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //  backgroundColor: AppColors.th1whtbackgrd,
        appBar: myAppBar(
          //backgroundColor: AppColors.white,
          title: 'Scheduled Booking',
          leadingIcon: Icons.arrow_back_ios_outlined,

          centerTitle: true,
          titleFontSize: size.width * 0.042, // Specify font size here
          onLeadingPressed: () {
            Get.back();
            // _navcontroller.tabIndex(0);

            //Get.back();
            // Get.to(BottomNavBar());
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: size.height * 0.05,
                color: Colors.blueGrey.shade100,
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40, // Adjust the height for unselected tabs
                        child: Text(
                          'Live',
                          style: GoogleFonts.nunitoSans(
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40, // Adjust the height for unselected tabs
                        child: Text(
                          'Upcoming',
                          style: GoogleFonts.nunitoSans(
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                      color: MyTheme.themecolor,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: MyTheme.logored)),
                  // Empty box decoration to remove the underline
                  labelColor: MyTheme.whitecolor, // Color for selected tab
                  unselectedLabelColor:
                      Colors.black, // Color for unselected tabs
                  labelStyle: GoogleFonts.roboto(
                      fontSize: size.height * 0.017,
                      fontWeight: FontWeight.w300),
                  unselectedLabelStyle: GoogleFonts.roboto(
                      fontSize: size.height * 0.017,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Container(
                  //   height: size.height,
                  //   width: size.width,
                  //   color: Colors.red,
                  //   child: Center(child: Text("Live")),
                  // ),

                  ScheduledLiveBooking(),

                  ///BarChartSample8(),
                  // monthly_sales(
                  //   isShowingMainData: true,
                  // ),
                  UpcomingScheduledBooking(),

                  /// LineCharts(),
                  // Container(
                  //   height: size.height,
                  //   width: size.width,
                  //   color: Colors.blue,
                  //   child: Center(child: Text("upcoming")),
                  // ),

                  ///BarChartSample4(),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     'Reports......',
                  //     style: GoogleFonts.poppins(
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: size.width * 0.033,
                  //       color: AppColors.a15,
                  //     ),
                  //   ),
                  // ),
                  ///
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     'Reports......',
                  //     style: GoogleFonts.poppins(
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: size.width * 0.033,
                  //       color: AppColors.a15,
                  //     ),
                  //   ),
                  // ),
                  //LineChartSample5(),
                  ///BookingHistory(),
                  // Container(
                  //   height: size.height,
                  //   width: size.width,
                  //   color: Colors.green,
                  //   child: Center(child: Text("History")),
                  // ),

                  ///todo:....................
                  // Your tab views here
                  // Example:
                  // PlacesTab(),
                  // InspirationTab(),
                  // EmotionsTab(),
                ],
              ),
            ),
          ],
        ),

        // },
        //),
      ),
    );
  }
}