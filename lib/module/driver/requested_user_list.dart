import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../../contantss/appbar/appbar_custom.dart';
import '../../contantss/texts/text_string_constant.dart';

class ReqestUserList extends StatelessWidget {
  const ReqestUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: MyTheme.whitecolor,
      appBar: myAppBar(
        backgroundColor: MyTheme.drivericon,
        title: 'Request Lists',
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
                              height: size.height * 0.31,
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
                                                      "https://image.pi7.org/static/img/circle_crop.webp"))),
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
                                                'Bhawya',
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.height * 0.045,
                                          width: size.width * 0.19,
                                          decoration: BoxDecoration(
                                            color: MyTheme.dvrskyblueshad5,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            //shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'ACCEPT',
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.height * 0.045,
                                          width: size.width * 0.19,
                                          decoration: BoxDecoration(
                                            color: MyTheme.logored,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            //shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'DECLINE',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
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
                                          'PickUp',
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
                                        child: Text(
                                          'Noida, C53, Sector 2, 201301',
                                          style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Drop Off',
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
                                        child: Text(
                                          'Noida, A62, Sector 62, 201306, UP.',
                                          style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    height: 2,
                                    thickness: 1.5,
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        // height: size.height * 0.05,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  'Distance',
                                                  style: GoogleFonts.raleway(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                            SizedBox(
                                              width: size.width * 0.3,
                                              // height: size.height * 0.03,

                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.track_changes_sharp,
                                                    size: 20,
                                                    color:
                                                        MyTheme.dvrskyblueshad3,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        '10 KM',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        width: 1.6,
                                        height: size.height * 0.04,
                                      ),
                                      Container(
                                        width: size.width * 0.3,
                                        // height: size.height * 0.05,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  'Rate per Km',
                                                  style: GoogleFonts.raleway(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                            SizedBox(
                                              width: size.width * 0.3,
                                              // height: size.height * 0.03,

                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .account_balance_outlined,
                                                    size: 20,
                                                    color:
                                                        MyTheme.dvrskyblueshad3,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        "  ${AppConstants.rupies}20",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        width: 1.6,
                                        height: size.height * 0.04,
                                      ),
                                      Container(
                                        width: size.width * 0.3,
                                        // height: size.height * 0.05,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  'Time',
                                                  style: GoogleFonts.raleway(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                            SizedBox(
                                              width: size.width * 0.3,
                                              // height: size.height * 0.03,

                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.watch_later,
                                                    size: 20,
                                                    color:
                                                        MyTheme.dvrskyblueshad3,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        '20 h',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
