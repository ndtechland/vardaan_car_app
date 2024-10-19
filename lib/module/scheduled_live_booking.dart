import 'package:flutter/material.dart';

import '../contantss/textfield_constant/text_2d.dart';
import '../contantss/texts/3d_texts.dart';
import '../theme_color/theme_color.dart';

class ScheduledLiveBooking extends StatelessWidget {
  const ScheduledLiveBooking({Key? key}) : super(key: key);

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
                    image: DecorationImage(
                        image: NetworkImage(
                            //
                            "https://images.unsplash.com/photo-1501884428012-aa321a256730?q=80&w=2674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            // "https://images.unsplash.com/photo-1502021680532-838cfc650323?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            // "https://images.unsplash.com/photo-1661115400281-5f2920812765?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDQ2fHx8ZW58MHx8fHx8"
                            // "https://images.unsplash.com/photo-1449182325215-d517de72c42d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDQ1fHx8ZW58MHx8fHx8"
                            // "https://images.unsplash.com/photo-1515674744565-0d7112cd179a?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            // "https://images.unsplash.com/photo-1539639087565-41c59f40f3d7?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                            //
                            ),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                fontColor: Colors.white,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),

                              ThreeDtext(
                                text: 'OTP :',
                                fontColor: Colors.white,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                              ThreeDtext(
                                text: 'Driver Id :',
                                fontColor: Colors.white,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                              ThreeDtext(
                                text: 'Cab Id :',
                                fontColor: Colors.white,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                              ThreeDtext(
                                text: 'Cab Name :',
                                fontColor: Colors.white,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),

                              ThreeDtext(
                                text: 'Pickup Time :',
                                fontColor: Colors.white,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                              ThreeDtext(
                                text: 'Pickup Location :',
                                fontColor: Colors.white,
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
                                  fontColor: Colors.red.shade100,
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
                                  fontColor: Colors.red.shade100,
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "1234SED",
                                  fontColor: Colors.red.shade100,
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "Maruti Swift",
                                  fontColor: Colors.red.shade100,
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "12:30 P.M.",
                                  fontColor: Colors.red.shade100,
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
                                      text:
                                          "C53, Block C, Sector 2, Noida       ",
                                      fontColor: Colors.red.shade100,
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.2,
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.g1,
                                  border: Border.all(
                                      color: Colors.red.shade900, width: 2)),
                              child: Center(
                                  child: Text(
                                "Confirm",
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
                                "No Show",
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
