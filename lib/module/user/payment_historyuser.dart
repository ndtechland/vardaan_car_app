// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// import '../contantss/appbar/appbar_custom.dart';
// import '../contantss/textfield_constant/text_2d.dart';
// import '../contantss/texts/3d_texts.dart';
// import '../theme_color/theme_color.dart';
//
// class BookingHistory extends StatelessWidget {
//   const BookingHistory({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> subtitle1 = [
//       '26-12-24',
//       '21-12-23',
//       '22-12-21',
//       '21-12-22',
//       '20-12-24',
//       '10-12-20',
//       '16-12-23',
//       '06-12-21',
//       '24-12-23',
//       '23-12-23',
//     ];
//
//     ///
//     final List<String> subtitle2 = [
//       '14:34',
//       '10:30',
//       '06:34',
//       '05:09',
//       '14:14',
//       '12:31',
//       '08:33',
//       '05:29',
//       '12:00',
//       '23:34',
//     ];
//
//     final List<String> subtitle3 = [
//       '₹ 100',
//       '₹ 400',
//       '₹ 300',
//       '₹ 600',
//       '₹ 800',
//       '₹ 1000',
//       '₹ 200',
//       '₹ 800',
//       '₹ 500',
//       '₹ 700',
//     ];
//     final List<Color> tileColors = [
//       AppColors.a3,
//       AppColors.a5,
//       // AppColors.a14,
//       //AppColors.a6,
//       //AppColors.a7,
//       // AppColors.a3,
//       //AppColors.a5,
//       //AppColors.a14,
//       //AppColors.a6,
//       //AppColors.a7,
//     ];
//
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColors.th1whtbackgrd,
//       appBar: myAppBar(
//         //backgroundColor: AppColors.white,
//         title: 'Booking History',
//
//         leadingIcon: Icons.arrow_back_ios_outlined,
//
//         centerTitle: true,
//         titleFontSize: size.width * 0.042, // Specify font size here
//
//         onLeadingPressed: () {
//           Get.back();
//
//           // Handle leading icon press
//         },
//         searchIcon: null,
//         onSearchPressed: () {
//           // Handle search icon press
//         },
//         userIcon: null,
//         onUserPressed: () {
//           // Handle user icon press
//         },
//       ),
//       body: ListView.builder(
//         itemCount: subtitle1.length,
//         itemBuilder: (BuildContext context, int index) {
//           // Ensure the index is within bounds of tileColors list
//           int colorIndex = index % tileColors.length;
//           Color tileColor = tileColors[colorIndex];
//
//           return Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: PhysicalModel(
//               color: AppColors.black,
//               shadowColor: AppColors.graphline,
//               elevation: 4,
//               borderRadius: BorderRadius.circular(10),
//               child: Container(
//                 height: size.height * 0.09,
//                 width: size.width,
//                 decoration: BoxDecoration(
//                   color: AppColors.th1wht2,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: AppColors.a15),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ThreeDtext(
//                             text: 'Recharge Date',
//                             fontColor: Colors.black,
//                             fontSize: size.height * 0.014,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           //ThreeDtext2
//                           ThreeDtext2(
//                             text: subtitle1[index],
//                             fontColor: Colors.black,
//                             fontSize: size.height * 0.017,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ThreeDtext(
//                             text: "Recharge Time",
//                             fontColor: Colors.black,
//                             fontSize: size.height * 0.014,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           //ThreeDtext2
//                           ThreeDtext2(
//                             text: subtitle2[index],
//                             fontColor: Colors.black,
//                             fontSize: size.height * 0.017,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ThreeDtext(
//                             text: "Recharge Amount",
//                             fontColor: Colors.black,
//                             fontSize: size.height * 0.014,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           //ThreeDtext2
//                           ThreeDtext2(
//                             text: subtitle3[index],
//                             fontColor: Colors.black,
//                             fontSize: size.height * 0.017,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//           //   ListTile(
//           //   title: Text(items[index]),
//           //   tileColor: tileColor, // Assign color to ListTile
//           //   onTap: () {
//           //     // Action when the ListTile is tapped
//           //     print('Tapped on ${items[index]}');
//           //   },
//           //   // Add more properties to ListTile if needed
//           // );
//         },
//       ),
//     );
//   }
// }
