import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

import '../../contantss/dailog/dailog_for_start_trip.dart';

class MapTrackingUser extends StatefulWidget {
  const MapTrackingUser({super.key});

  @override
  State<MapTrackingUser> createState() => _MapTrackingUserState();
}

class _MapTrackingUserState extends State<MapTrackingUser> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.drivericon,
        title: const Text(
          'Track User',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          // Map occupying 65% of the screen height
          Expanded(
            flex: 13,
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(28.5847, 77.3159), // Initial location
                    zoom: 13,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('userMarker'),
                      position: LatLng(28.5847, 77.3159),
                      infoWindow: InfoWindow(title: 'User Location'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueBlue), // Custom hue for user
                    ),
                    Marker(
                      markerId: MarkerId('driverMarker'),
                      position: LatLng(28.5947, 77.3259),
                      infoWindow: InfoWindow(title: 'Driver Location'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen), // Custom hue for driver
                    ),
                    Marker(
                      markerId: MarkerId('destinationMarker'),
                      position: LatLng(28.6000, 77.3300),
                      infoWindow: InfoWindow(title: 'Destination'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor
                              .hueRed), // Custom hue for destination
                    ),
                  },
                  polylines: {
                    Polyline(
                      polylineId: PolylineId('driverToUser'),
                      points: [
                        LatLng(28.5947, 77.3259),
                        LatLng(28.5900, 77.3200),
                        LatLng(28.5847, 77.3159),
                      ],
                      color: Colors.red,
                      width: 5,
                    ),
                    Polyline(
                      polylineId: PolylineId('userToDestination'),
                      points: [
                        LatLng(28.5847, 77.3159),
                        LatLng(28.5905, 77.3250),
                        LatLng(28.6000, 77.3300),
                      ],
                      color: Colors.blue,
                      width: 5,
                    ),
                  },
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.sos),
                    onPressed: () {
                      _showSosDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          // User details section occupying 25% of the screen height
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?semt=ais_hybrid',
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paul Burgess',
                            style: GoogleFonts.roboto(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.023,
                              fontWeight: FontWeight.bold,
                              color: MyTheme.themecolor,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '2.2 Km',
                                style: GoogleFonts.roboto(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.w400,
                                  color: MyTheme.greyColor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '2 min',
                                style: GoogleFonts.roboto(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.logored,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withOpacity(0.25),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.call, color: Colors.green),
                          onPressed: () {
                            // Call action
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.11,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withOpacity(0.20),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.warning_rounded,
                              color: Colors.red,
                              size: 25,
                            ),
                            onPressed: () {
                              _showemergencyDialog();
                              // Call action
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 15,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'PICK-UP',
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          fontWeight: FontWeight.w400,
                          color: MyTheme.greyColor.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        'C 53, Bloc C, Sector-2, noida 201301, UP.',
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.themecolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 15,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'DESTINATION',
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          fontWeight: FontWeight.w400,
                          color: MyTheme.greyColor.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        'A 51, Bloc A, Sector-43, noida 201304, UP.',
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.themecolor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withOpacity(0.25),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.refresh, color: Colors.black),
                          onPressed: () {
                            // Call action
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Cancel action
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.logored),
                          child: Text('Cancel'),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.dialog(PickupDialog());

                            // Go to Pickup action
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.drivericon),
                          child: Text('Go to Pickup'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSosDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emergency SOS'),
          content: Text('Are you sure you want to send an SOS signal?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Handle pickup action here
                Get.back();
                // controller.goToPickup();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the button color
              ),
              child: Text('Send SOS'),
            ),
            // TextButton(
            //   child: Text('Send SOS'),
            //   onPressed: () {
            //     // Handle SOS action
            //     Navigator.of(context).pop();
            //   },
            // ),
          ],
        );
      },
    );
  }

  void _showemergencyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Emergency Call !',
            style: GoogleFonts.roboto(
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.bold,
              color: MyTheme.themecolor,
            ),
          ),
          content: Text(
            'Do you want to call emergency number 9911879555?',
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
                'Cancel',
                style: TextStyle(color: MyTheme.logored),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                const phoneNumber = 'tel:9911879555';
                if (await canLaunch(phoneNumber)) {
                  await launch(phoneNumber);
                } else {
                  throw 'Could not launch $phoneNumber';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Call',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
