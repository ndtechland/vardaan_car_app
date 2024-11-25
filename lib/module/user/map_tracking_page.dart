import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vardaancar/theme_color/theme_color.dart';

class MapTracking extends StatefulWidget {
  const MapTracking({super.key});

  @override
  State<MapTracking> createState() => _MapTrackingState();
}

class _MapTrackingState extends State<MapTracking> {
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    //todo: Show the modal bottom sheet when the screen is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 400,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    onLongPress: () {
                      Get.back();
                    },
                    child: Center(
                      child: Container(
                        height: 8,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                                'assets/images/drivericon.jpg'), // Driver image
                          ),
                          SizedBox(width: 08),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Shubham',
                                style: GoogleFonts.raleway(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.027,
                                    fontWeight: FontWeight.bold,
                                    color: MyTheme.logored),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              _showusercallDialog();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: MyTheme.themecolor,
                                    shape: BoxShape.circle
                                    // Color for Call Driver row
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              _showemergencyDialog();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: MyTheme.logored,
                                    shape: BoxShape.circle
                                    // Color for Call Driver row
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.warning,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // SizedBox(height: 06),

                  ///todo:.........................
                  SizedBox(height: 3),
                  // Driver Details
                  _buildDriverDetailRow('Vehicle Number:', 'DGEAd3454'),
                  _buildDriverDetailRow('Onboard OTP:', '123456'),

                  SizedBox(height: 4),
                  Divider(),

                  _buildDetailRow('Racility Cab ID:', '5678'),
                  _buildDetailRow('Trip Date:', '2024-10-11'),
                  _buildDetailRow('Trip Type:', 'One Way'),
                  _buildDetailRow('Shift Time:', '10:00 AM'),
                  _buildDetailRow('Pickup Time:', '9:30 AM'),
                  _buildDetailRow('Cab Status:', 'On the way'),
                  _buildDetailRow('Cab Location:', '123 Main St, City'),
                  //  SizedBox(height: 16),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[500], shape: BoxShape.circle
                              // Color for Call Driver row
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement reject functionality
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  MyTheme.logored // Accept button color
                              ), // Reject button color
                          child: Text(
                            'Reject',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement accept functionality
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  MyTheme.themecolor), // Accept button color
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              color: Colors.white,
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late GoogleMapController _mapController;

    // Define a unique ID for the polylines
    const PolylineId driverToUserPolylineId = PolylineId('driverToUser');
    const PolylineId userToDestinationPolylineId =
        PolylineId('userToDestination');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.themecolor,
        title: const Text(
          'Track Driver',
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
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(
                  28.5847, 77.3159), // Set to your desired initial location
              zoom: 12,
            ),
            markers: {
              Marker(
                markerId: MarkerId('userMarker'),
                position: LatLng(28.5847, 77.3159), // User's location
                infoWindow: InfoWindow(title: 'User Location'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
// Green marker for user
              ),
              Marker(
                markerId: MarkerId('driverMarker'),
                position: LatLng(28.5947, 77.3259), // Driver's location
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure), // Magenta marker for driver
                infoWindow: InfoWindow(title: 'Driver Location'),
              ),
              Marker(
                markerId: MarkerId('destinationMarker'),
                position: LatLng(28.6000, 77.3300), // Destination location
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed), // Red marker for destination
                infoWindow: InfoWindow(title: 'Destination'),
              ),
            },
            polylines: {
              Polyline(
                polylineId: driverToUserPolylineId,
                points: [
                  LatLng(28.5947, 77.3259), // Driver's location
                  LatLng(
                      28.5900, 77.3200), // Intermediate point to create a curve
                  LatLng(28.5847, 77.3159), // User's location
                ],
                color: Colors.red, // Color for line from driver to user
                width: 5,
              ),
              Polyline(
                polylineId: userToDestinationPolylineId,
                points: [
                  LatLng(28.5847, 77.3159), // User's location
                  LatLng(
                      28.5905, 77.3250), // Intermediate point to create a curve
                  LatLng(28.6000, 77.3300), // Destination location
                ],
                color: Colors.blue, // Color for line from user to destination
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
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  //gradient: MyTheme.gradient9,
                  borderRadius: BorderRadius.circular(20.0), // Rounded corners
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.themecolor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ), // Makes button background transparent
                    shadowColor: Colors.black, // Removes shadow
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 24.0),
                  ),
                  child: const Text(
                    'View Details',
                    style: TextStyle(
                      color: Colors.white,
                    ), // Text color
                  ),
                  onPressed: () {
                    _showBottomSheet(); // Manually show the bottom sheet on button press
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///todo dailog.....

  Widget _buildDriverDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16, // Bigger size for left text
              color: MyTheme.themecolor, // Navy blue text color
            ),
          ),
        ),
        SizedBox(width: 10), // Add some spacing
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16, // Size for right text
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.bold,
              fontSize: 16, // Bigger size for left text
              color: Colors.blue[800], // Navy blue text color
            ),
          ),
        ),
        SizedBox(width: 16), // Add some spacing
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.nunitoSans(
              color: Colors.black,
              fontSize: 16, // Size for right text
            ),
          ),
        ),
      ],
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
              child: Text(
                'Send SOS',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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

  void _showusercallDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Want  to Call !',
            style: GoogleFonts.roboto(
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.bold,
              color: MyTheme.themecolor,
            ),
          ),
          content: Text(
            'Do you want to call driver the number is number 9911879555?',
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
