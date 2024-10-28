import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../../contantss/texts/text_string_constant.dart';

class CompletedBookingDriver extends StatelessWidget {
  const CompletedBookingDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.81,
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
                        color: MyTheme.drivertheme.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            elevation: 5,
                            color: Colors.black,
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
                                                      "https://jfanphoto.com/wp-content/gallery/medical/st-petersburg-medical-professional-headshot.jpg"
                                                      //"https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg&fm=jpg"
                                                      //"https://images.unsplash.com/photo-1464863979621-258859e62245?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmVtYWxlJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
                                                      // "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZmVtYWxlJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
                                                      //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP_UmdQ0q7AgeI5z8xdoRcrVpjWGnlLGXBp70B6A9fNx7SJ4sU71sGJUPsJYCXhppM2XA&usqp=CAU"
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
                                              height: size.height * 0.037,
                                              width: size.width * 0.33,
                                              child: Text(
                                                'Shayra',
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: MediaQuery.of(
                                                              context)
                                                          .size
                                                          .height *
                                                      0.025, // Responsive font size
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
                                              '13/10/2024',
                                              style: GoogleFonts.aBeeZee(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: MyTheme.dvrskyblueshad6,
                                              ),
                                            ),
                                            Text(
                                              '03:12 PM',
                                              style: GoogleFonts.aBeeZee(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: MyTheme.logored,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            // Get.to(MapTrackingUser());
                                            _showemergencyDialog(context);
                                          },
                                          child: Container(
                                            height: size.height * 0.036,
                                            width: size.width * 0.20,
                                            decoration: BoxDecoration(
                                              color: Colors.green.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              //shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'COMPLETED',
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11,
                                                  color: Colors.grey.shade100,
                                                ),
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
                                          'Gurugram, , Sector 15, 120094',
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
                                          'Gurugram, , Sector 12, 110091',
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
                                                        '11 KM',
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
                                                    Icons.currency_rupee,
                                                    size: 20,
                                                    color:
                                                        MyTheme.dvrskyblueshad3,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        "  ${AppConstants.rupies}15",
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
                                                        '0.6 h',
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

  void _showemergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Cancel Trip !',
            style: GoogleFonts.roboto(
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.bold,
              color: MyTheme.themecolor,
            ),
          ),
          content: Text(
            'Do you want to cancel?',
            style: GoogleFonts.roboto(
              fontSize: MediaQuery.of(context).size.height * 0.018,
              color: MyTheme.greyColor,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(color: MyTheme.logored),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // const phoneNumber = 'tel:9911879555';
                // if (await canLaunch(phoneNumber)) {
                //   await launch(phoneNumber);
                // } else {
                //   throw 'Could not launch $phoneNumber';
                // }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
