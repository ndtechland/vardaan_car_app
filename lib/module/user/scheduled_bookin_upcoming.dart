import 'package:flutter/material.dart';

import '../../contantss/textfield_constant/text_2d.dart';
import '../../contantss/texts/3d_texts.dart';
import '../../theme_color/theme_color.dart';

class UpcomingScheduledBooking extends StatelessWidget {
  const UpcomingScheduledBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> tileColors = [
      AppColors.a3,
      AppColors.a5,
      // AppColors.a14,
      //AppColors.a6,
      //AppColors.a7,
      // AppColors.a3,
      //AppColors.a5,
      //AppColors.a14,
      //AppColors.a6,
      //AppColors.a7,
    ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.th1whtbackgrd,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          // Ensure the index is within bounds of tileColors list
          int colorIndex = index % tileColors.length;
          Color tileColor = tileColors[colorIndex];

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: PhysicalModel(
              color: AppColors.g1,
              shadowColor: AppColors.primaryColor,
              elevation: 4,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                // height: size.height * 0.09,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.th1wht2,
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         "https://images.unsplash.com/photo-1608664330225-b4caded73781?q=80&w=2673&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //         //"https://images.unsplash.com/photo-1703868673325-64d7d7afa618?q=80&w=2576&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //         // "https://images.unsplash.com/photo-1513735429658-5b2072a1cee6?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //         ),
                  //     fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.g1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThreeDtext(
                                text: 'Facility :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.w500,
                              ),
                              ThreeDtext(
                                text: 'Cab Id :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.w500,
                              ),
                              ThreeDtext(
                                text: 'Cab Name :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.w500,
                              ),
                              ThreeDtext(
                                text: 'Pickup Date :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.w500,
                              ),
                              ThreeDtext(
                                text: 'Pickup Time :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.w500,
                              ),
                              ThreeDtext(
                                text: 'Pickup Location :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.017,
                                fontWeight: FontWeight.w500,
                              ),

                              //ThreeDtext2
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //ThreeDtext2

                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "Vardaan Driver",
                                  fontColor: AppColors.a5,
                                  fontSize: size.height * 0.015,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "1234SED",
                                  fontColor: AppColors.a5,
                                  fontSize: size.height * 0.015,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "Maruti Swift",
                                  fontColor: AppColors.a5,
                                  fontSize: size.height * 0.015,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "25/12/2024",
                                  fontColor: AppColors.a5,
                                  fontSize: size.height * 0.015,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "12:30 P.M.",
                                  fontColor: AppColors.a5,
                                  fontSize: size.height * 0.015,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  height: size.height * 0.025,
                                  width: size.width * 0.5,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ThreeDtext2(
                                      text:
                                          "C53, Block C, Sector 2, Noida       ",
                                      fontColor: AppColors.a5,
                                      fontSize: size.height * 0.015,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  color: MyTheme.themecolor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.yellow.shade900, width: 2)),
                              child: Center(
                                  child: Text(
                                "Week Off",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyTheme.greyColor,
                                  border: Border.all(
                                      color: Colors.red.shade900, width: 2)),
                              child: Center(
                                  child: Text(
                                "Leave",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyTheme.logored,
                                  border: Border.all(
                                      color: Colors.yellow.shade900, width: 2)),
                              child: Center(
                                  child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

          //   ListTile(
          //   title: Text(items[index]),
          //   tileColor: tileColor, // Assign color to ListTile
          //   onTap: () {
          //     // Action when the ListTile is tapped
          //     print('Tapped on ${items[index]}');
          //   },
          //   // Add more properties to ListTile if needed
          // );
        },
      ),
    );
  }
}
