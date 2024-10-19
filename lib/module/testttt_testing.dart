// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';
// //
// // class GoogleLensLauncher extends StatelessWidget {
// //   // URL for Google Lens through Google
// //   final String _googleLensUrl = 'https://www.google.com/search/about/lens';
// //
// //   // Function to launch Google Lens URL
// //   void _launchGoogleLens() async {
// //     if (await canLaunch(_googleLensUrl)) {
// //       await launch(_googleLensUrl);
// //     } else {
// //       throw 'Could not launch $_googleLensUrl';
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Launch Google Lens'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: _launchGoogleLens,
// //           child: Text('Open Google with Lens'),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:vardaancar/theme_color/theme_color.dart';
//
// class Testtt extends StatefulWidget {
//   const Testtt({super.key});
//
//   @override
//   State<Testtt> createState() => _TestttState();
// }
//
// class _TestttState extends State<Testtt> {
//   late GoogleMapController _mapController;
//
//   @override
//   void initState() {
//     super.initState();
//     // Show the modal bottom sheet when the screen is first built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showBottomSheet();
//     });
//   }
//
//   void _showBottomSheet() {
//     showModalBottomSheet<void>(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: 400,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Center(
//                     child: Container(
//                       height: 8,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.black87,
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                     ),
//                   ),
//
//                   Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 40,
//                             backgroundImage: AssetImage(
//                                 'assets/images/drivericon.jpg'), // Driver image
//                           ),
//                           SizedBox(width: 08),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             height: MediaQuery.of(context).size.height * 0.05,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Shubham',
//                                 style: GoogleFonts.alegreya(
//                                     fontSize:
//                                         MediaQuery.of(context).size.height *
//                                             0.027,
//                                     fontWeight: FontWeight.bold,
//                                     color: MyTheme.logored),
//                               ),
//                             ),
//                           ),
//                           Spacer(),
//                           Container(
//                               decoration: BoxDecoration(
//                                   color: MyTheme.themecolor,
//                                   shape: BoxShape.circle
//                                   // Color for Call Driver row
//                                   ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Icon(
//                                   Icons.call,
//                                   color: Colors.white,
//                                 ),
//                               )),
//                           SizedBox(width: 16),
//                           Container(
//                               decoration: BoxDecoration(
//                                   color: MyTheme.logored, shape: BoxShape.circle
//                                   // Color for Call Driver row
//                                   ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Center(
//                                   child: Icon(
//                                     Icons.warning,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               )),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   // SizedBox(height: 06),
//
//                   ///todo:.........................
//                   SizedBox(height: 3),
//                   // Driver Details
//                   _buildDriverDetailRow('Vehicle Number:', 'DGEAd3454'),
//                   _buildDriverDetailRow('Onboard OTP:', '123456'),
//
//                   SizedBox(height: 5),
//
//                   _buildDetailRow('Racility Cab ID:', '5678'),
//                   _buildDetailRow('Trip Date:', '2024-10-11'),
//                   _buildDetailRow('Trip Type:', 'One Way'),
//                   _buildDetailRow('Shift Time:', '10:00 AM'),
//                   _buildDetailRow('Pickup Time:', '9:30 AM'),
//                   _buildDetailRow('Cab Status:', 'On the way'),
//                   _buildDetailRow('Cab Location:', '123 Main St, City'),
//                   //  SizedBox(height: 16),
//                   SizedBox(height: 5),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           decoration: BoxDecoration(
//                               color: Colors.grey[500], shape: BoxShape.circle
//                               // Color for Call Driver row
//                               ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Center(
//                               child: Icon(
//                                 Icons.refresh,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           )),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Implement reject functionality
//                           },
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.red), // Reject button color
//                           child: Text('Reject'),
//                         ),
//                       ),
//                       SizedBox(width: 6),
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Implement accept functionality
//                           },
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.green), // Accept button color
//                           child: Text('Accept'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyTheme.themecolor,
//         title: const Text(
//           'Track',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               _mapController = controller;
//             },
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(28.5847, 77.3159), // Set to your desired location
//               zoom: 10,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       MyTheme.themecolor, // Light green
//                       MyTheme.themecolor, // Darker green
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(8.0), // Rounded corners
//                 ),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors
//                         .transparent, // Makes button background transparent
//                     shadowColor: Colors.transparent, // Removes shadow
//                     padding:
//                         EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                   ),
//                   child: const Text(
//                     'View Details',
//                     style: TextStyle(color: Colors.white), // Text color
//                   ),
//                   onPressed: () {
//                     _showBottomSheet(); // Manually show the bottom sheet on button press
//                   },
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDriverDetailRow(String label, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Text(
//             label,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 16, // Bigger size for left text
//               color: MyTheme.themecolor, // Navy blue text color
//             ),
//           ),
//         ),
//         SizedBox(width: 10), // Add some spacing
//         Expanded(
//           child: Text(
//             value,
//             style: GoogleFonts.poppins(
//               color: Colors.black,
//               fontSize: 16, // Size for right text
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDetailRow(String label, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Text(
//             label,
//             style: GoogleFonts.nunitoSans(
//               fontWeight: FontWeight.bold,
//               fontSize: 16, // Bigger size for left text
//               color: Colors.blue[800], // Navy blue text color
//             ),
//           ),
//         ),
//         SizedBox(width: 16), // Add some spacing
//         Expanded(
//           child: Text(
//             value,
//             style: GoogleFonts.nunitoSans(
//               color: Colors.black,
//               fontSize: 16, // Size for right text
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
