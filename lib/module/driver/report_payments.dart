import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/textfield_constant/text_2d.dart';
import '../../contantss/texts/3d_texts.dart';
import '../../theme_color/theme_color.dart';

class ReportPayment extends StatelessWidget {
  const ReportPayment({Key? key}) : super(key: key);

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
      appBar: myAppBar(
        backgroundColor: MyTheme.drivericon,
        title: 'Driver Payment Report',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
        // actionIcon: Icons.emergency,
        // onActionPressed: () {
        //  // _showEmergencyDialog(context); // Show emergency confirmation dialog
        // },
      ),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.g1),
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         //
                  //         "https://images.unsplash.com/photo-1501884428012-aa321a256730?q=80&w=2674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //         // "https://images.unsplash.com/photo-1502021680532-838cfc650323?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //         // "https://images.unsplash.com/photo-1661115400281-5f2920812765?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDQ2fHx8ZW58MHx8fHx8"
                  //         // "https://images.unsplash.com/photo-1449182325215-d517de72c42d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDQ1fHx8ZW58MHx8fHx8"
                  //         // "https://images.unsplash.com/photo-1515674744565-0d7112cd179a?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //         // "https://images.unsplash.com/photo-1539639087565-41c59f40f3d7?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                  //         //
                  //         ),
                  //     fit: BoxFit.fill)
                ),
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
                                text: 'Month Name :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                              ThreeDtext(
                                text: 'Payment Id :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),

                              ThreeDtext(
                                text: 'Total Payment :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                              ThreeDtext(
                                text: 'Payment Date :',
                                fontColor: Colors.black,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                              ThreeDtext(
                                text: 'Payment Time :',
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
                                  text: "Oct 2024",
                                  fontColor: MyTheme.dvrskyblueshad6,
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ThreeDtext2(
                                  text: "5765777653WQ",
                                  fontColor: MyTheme.dvrskyblueshad6,
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ThreeDtext2(
                                    text: "Rs. 10344",
                                    fontColor: MyTheme.dvrskyblueshad6,
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ThreeDtext2(
                                    text: "29 oct 2024",
                                    fontColor: MyTheme.dvrskyblueshad6,
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ThreeDtext2(
                                    text: "10:00 AM",
                                    fontColor: MyTheme.dvrskyblueshad6,
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
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
