import 'package:flutter/material.dart';

import '../contantss/textfield_constant/text_2d.dart';
import '../contantss/texts/3d_texts.dart';
import '../theme_color/theme_color.dart';

class LiveBooking extends StatelessWidget {
  const LiveBooking({Key? key}) : super(key: key);

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
        itemCount: 1,
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
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.g1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),

                          ThreeDtext(
                            text: 'OTP :',
                            fontColor: Colors.black,
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),
                          ThreeDtext(
                            text: 'Driver Id :',
                            fontColor: Colors.black,
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),
                          ThreeDtext(
                            text: 'Cab Id :',
                            fontColor: Colors.black,
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),
                          ThreeDtext(
                            text: 'Cab Name :',
                            fontColor: Colors.black,
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),

                          ThreeDtext(
                            text: 'Pickup Time :',
                            fontColor: Colors.black,
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),
                          ThreeDtext(
                            text: 'Pickup Location :',
                            fontColor: Colors.black,
                            fontSize: size.height * 0.019,
                            fontWeight: FontWeight.w600,
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
                              fontColor: AppColors.greyColor,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ThreeDtext2(
                              text: "12345",
                              fontColor: MyTheme.logored,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ThreeDtext2(
                              text: "1345WESQ",
                              fontColor: AppColors.greyColor,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ThreeDtext2(
                              text: "1234SED",
                              fontColor: AppColors.greyColor,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ThreeDtext2(
                              text: "Maruti Swift",
                              fontColor: AppColors.greyColor,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ThreeDtext2(
                              text: "12:30 P.M.",
                              fontColor: AppColors.greyColor,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w600,
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
                                  text: "C53, Block C, Sector 2, Noida       ",
                                  fontColor: AppColors.greyColor,
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
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
