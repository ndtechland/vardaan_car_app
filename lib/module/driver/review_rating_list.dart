import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../../contantss/appbar/appbar_custom.dart';

class ReviewRatingList extends StatelessWidget {
  const ReviewRatingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: MyTheme.whitecolor,
      appBar: myAppBar(
        backgroundColor: MyTheme.drivericon,
        title: 'Rating Review',
        leadingIcon: Icons.arrow_back_ios_outlined,
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
        // actionIcon: Icons.emergency,
        // onActionPressed: () {
        //   // _showEmergencyDialog(context); // Show emergency confirmation dialog
        // },
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.87,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5, // The number of items in the list
                  itemBuilder: (context, index) {
                    // Replace yourDataList[index] with the relevant data you want to use
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: PhysicalModel(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(5),
                        shadowColor: Colors.black,
                        color: MyTheme.dvrskyblue5,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            elevation: 17,
                            color: Colors.red,
                            clipBehavior: Clip.none,
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: size.height * 0.26,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                //border: Border.all(color: MyTheme.drivertheme)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,

                                    //mainaxisallignment Mainaxisallignment.spacebetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.height * 0.08,
                                          width: size.width * 0.17,
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://vailfucci.com/wp-content/uploads/2021/07/lara-rotter-0013.jpg"
                                                      // "https://images.squarespace-cdn.com/content/v1/572e050c4d088ea3a8f0ac9d/1498778997901-VO1YB7WFOLTS6CJ2IJV3/Medical+Residency+Headshots"
                                                      // "https://vailfucci.com/wp-content/uploads/2021/07/lara-rotter-0013.jpg"
                                                      //"https://image.pi7.org/static/img/circle_crop.webp"
                                                      ),
                                                  fit: BoxFit.cover)),
                                          //child: Icon(Icons.person),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.09,
                                        //width: size.width * 0.3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              //height: size.height * 0.037,
                                              width: size.width * 0.24,
                                              child: Text(
                                                'Ramana',
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: MediaQuery.of(
                                                              context)
                                                          .size
                                                          .height *
                                                      0.022, // Responsive font size
                                                  color: MyTheme.themecolor,
                                                ),
                                                overflow: TextOverflow
                                                    .ellipsis, // Shows '...' if text overflows
                                                softWrap:
                                                    true, // Wraps text to the next line if needed
                                                maxLines:
                                                    2, // Limits the text to 2 lines
                                              ),
                                            ),
                                            Text(
                                              '12/11/2024',
                                              style: GoogleFonts.aBeeZee(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: MyTheme.dvrskyblueshad6,
                                              ),
                                            ),
                                            Text(
                                              '12:23 PM',
                                              style: GoogleFonts.aBeeZee(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: MyTheme.dvrskyblueshad4,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 2,
                                    thickness: 1.5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Rating:',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Review:',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          height: size.height * 0.05,
                                          child: Text(
                                            'Professional and reliable service. The driver was honest and friendly.',
                                            style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
