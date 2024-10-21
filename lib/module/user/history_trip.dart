import 'package:flutter/material.dart';

import '../../contantss/textfield_constant/text_2d.dart';
import '../../contantss/texts/3d_texts.dart';
import '../../theme_color/theme_color.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> subtitle1 = [
      '26-12-24',
      '21-12-23',
      '22-12-21',
      '21-12-22',
      '20-12-24',
      '10-12-20',
      '16-12-23',
      '06-12-21',
      '24-12-23',
      '23-12-23',
    ];

    ///
    final List<String> subtitle2 = [
      '26-12-24',
      '21-12-23',
      '22-12-21',
      '21-12-22',
      '20-12-24',
      '10-12-20',
      '16-12-23',
      '06-12-21',
      '24-12-23',
      '23-12-23',
    ];

    final List<String> subtitle3 = [
      'Vardaan1 Staff',
      'Vardaan2 Staff',
      'Vardaan3 Staff',
      'Vardaan4 Staff',
      'Vardaan5 Staff',
      'Vardaan6 Staff',
      'Vardaan7 Staff',
      'Vardaan8 Staff',
      'Vardaan9 Staff',
      'Vardaan10 Staff',
    ];
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
        itemCount: subtitle1.length,
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
                height: size.height * 0.09,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.th1wht2,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.g1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThreeDtext(
                            text: 'Start Date',
                            fontColor: Colors.black,
                            fontSize: size.height * 0.016,
                            fontWeight: FontWeight.w600,
                          ),
                          //ThreeDtext2
                          ThreeDtext2(
                            text: subtitle1[index],
                            fontColor: MyTheme.logored,
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThreeDtext(
                            text: "End Date",
                            fontColor: Colors.black,
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w600,
                          ),
                          //ThreeDtext2
                          ThreeDtext2(
                            text: subtitle2[index],
                            fontColor: MyTheme.logored,
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThreeDtext(
                            text: "Facility",
                            fontColor: MyTheme.themecolor,
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w600,
                          ),
                          //ThreeDtext2
                          ThreeDtext2(
                            text: subtitle3[index],
                            fontColor: Colors.black,
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w500,
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
