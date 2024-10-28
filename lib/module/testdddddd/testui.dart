// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// class GenerateManualy extends StatefulWidget {
//   const GenerateManualy({super.key});
//
//   @override
//   State<GenerateManualy> createState() => _GenerateManualyState();
// }
//
// class _GenerateManualyState extends State<GenerateManualy> {
//   final MafController mafController = Get.put(MafController());
//   final GenerateMafController generateMafcontroller =
//       Get.put(GenerateMafController());
//   final LoginController loginController = Get.put(LoginController());
//   final ApprovalFormController approvalFormController =
//       Get.put(ApprovalFormController());
//   //final _inputKey = GlobalKey(debugLabel: 'inputText');
//   String dropdownvalue = 'Select';
//   var prefix = [
//     'Select',
//     'MR',
//     'MS',
//     'MRS',
//   ];
//   @override
//   void initState() {
//     //generateMafcontroller.dateInput.text = "";
//     generateMafcontroller.guestIdController?.text =
//         mafController.mafNumber.value;
//     generateMafcontroller.nameController?.text;
//     generateMafcontroller.numberController?.text;
//     generateMafcontroller.dateInput?.text =
//         DateFormat('MM/dd/yyyy').format(DateTime.now());
//     //set the initial value of text field
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//         backgroundColor: Colors.grey[100],
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               )),
//           title: Container(
//               decoration: const BoxDecoration(
//                   // color: Colors.white,
//                   ),
//               child: const Image(
//                 image: AssetImage('assets/logo.png'),
//                 height: 70,
//                 width: 70,
//               )),
//           centerTitle: true,
//         ),
//         body: Obx(() {
//           if (mafController.isLoading.value &&
//               generateMafcontroller.isLoading.value) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             generateMafcontroller.guestIdController?.text =
//                 mafController.mafNumber.value;
//             return SafeArea(
//                 child: OrientationBuilder(builder: (context, orientation) {
//               return LayoutBuilder(builder: (context, constraints) {
//                 var screenWidth = constraints.maxWidth;
//                 var screenHeight = constraints.maxHeight;
//
//                 // Define sizes based on orientation
//                 var imageWidth = orientation == Orientation.portrait
//                     ? screenWidth * 0.9
//                     : screenWidth * 0.9;
//                 var imageHeight = orientation == Orientation.portrait
//                     ? screenHeight * 0.2
//                     : screenHeight * 0.5;
//
//                 var categoryWidth = orientation == Orientation.portrait
//                     ? screenWidth * 1.0
//                     : screenWidth * 1.0;
//                 var categoryHeight = orientation == Orientation.portrait
//                     ? screenHeight * 0.12
//                     : screenHeight * 0.30;
//
//                 var textFieldWidth = orientation == Orientation.portrait
//                     ? screenWidth * 0.84
//                     : screenWidth * 0.87;
//                 var textFieldHeight = orientation == Orientation.portrait
//                     ? screenHeight * 0.15
//                     : screenHeight * 0.4;
//
//                 var iconSize = orientation == Orientation.portrait
//                     ? screenWidth * 0.08
//                     : screenWidth * 0.04;
//
//                 var textSize = orientation == Orientation.portrait
//                     ? screenWidth * 0.06
//                     : screenWidth * 0.03;
//                 var radiusSize = orientation == Orientation.portrait
//                     ? screenWidth * 0.08
//                     : screenWidth * 0.04;
//                 return SingleChildScrollView(
//                   child: Form(
//                     key: generateMafcontroller.generateMafFormKey,
//                     child: Container(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 18.0, horizontal: 18.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(
//                               height: 50,
//                             ),
//                             Center(
//                               child: Text(
//                                 "Generate MAF",
//                                 style: GoogleFonts.poppins(
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               "Guest ID",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 14, color: Colors.black87),
//                             ),
//                             FormContainer(
//                               h: h / 15,
//                               w: w / 1.1,
//                               //key: _inputKey,
//                               controller:
//                                   generateMafcontroller.guestIdController,
//                               hintText: "Guest ID",
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Date* (mm/dd/yyyy)",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 14, color: Colors.black87),
//                             ),
//                             DateContainer(
//                                 h: h / 15,
//                                 w: w / 1.1,
//                                 controller: generateMafcontroller.dateInput,
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime.now(),
//                                 hintText: "${DateTime.now()}"),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             Container(
//                               //color: Colors.pink,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 // crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   SizedBox(
//                                     width: w / 6,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Prefix",
//                                           style: GoogleFonts.poppins(
//                                               fontSize: 14,
//                                               color: Colors.black87),
//                                         ),
//                                         Container(
//                                           width: w / 4,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(8.0)),
//                                             border:
//                                                 Border.all(color: Colors.grey),
//                                           ),
//                                           child: DropdownButtonFormField(
//                                             alignment:
//                                                 AlignmentDirectional.center,
//                                             decoration: const InputDecoration(
//                                                 border: InputBorder.none),
//                                             value: generateMafcontroller
//                                                 .dropdownvalue,
//                                             icon: const Icon(
//                                               Icons.keyboard_arrow_down,
//                                               size: 16,
//                                             ),
//                                             items: prefix.map((String items) {
//                                               return DropdownMenuItem(
//                                                 value: items,
//                                                 child: Text(
//                                                   items,
//                                                   style: const TextStyle(
//                                                       fontSize: 14),
//                                                 ),
//                                               );
//                                             }).toList(),
//                                             onChanged: (String? newValue) {
//                                               setState(() {
//                                                 generateMafcontroller
//                                                     .dropdownvalue = newValue!;
//                                               });
//                                             },
//                                             validator: (value) => value == null
//                                                 ? 'Please Select Leave category'
//                                                 : null,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   //SizedBox(width: 10,),
//                                   SizedBox(
//                                     //color: Colors.pink,
//                                     width: w / 1.4,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Guest Name",
//                                           style: GoogleFonts.poppins(
//                                               fontSize: 14,
//                                               color: Colors.black87),
//                                         ),
//                                         FormContainer(
//                                           h: h / 15,
//                                           w: w / 1.5,
//                                           controller: generateMafcontroller
//                                               .nameController,
//                                           hintText: "Guest Name",
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             Text(
//                               "Mobile Number",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 14, color: Colors.black87),
//                             ),
//                             PhoneContainer(
//                                 h: h / 15,
//                                 w: w / 1.1,
//                                 controller:
//                                     generateMafcontroller.numberController,
//                                 hintText: "Enter Mobile Number"),
//                             const SizedBox(
//                               height: 6,
//                             ),
//                             Text(
//                               "(i.e 12345678910)",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 12, color: Colors.black87),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             Center(
//                                 child: NextButton(
//                                     onTap: () async {
//                                       print("submit");
//                                       // if (generateMafcontroller.generateMafFormKey.currentState!.validate()) {
//                                       //   final data = PostGenerateMafModel(
//                                       //     status: 1,
//                                       //     message: '',
//                                       //     data: Data(
//                                       //       id: 0,
//                                       //       approvalNumber: 0,
//                                       //       memberName: generateMafcontroller.nameController.text,
//                                       //       craeteDate: DateTime.parse(generateMafcontroller.dateInput.text),
//                                       //       welcomeFormNumber: '',
//                                       //       isMember: false,
//                                       //       mafNumber: generateMafcontroller.guestIdController.text,
//                                       //       dsaCode: '',
//                                       //       status: '',
//                                       //       mobileNumber: generateMafcontroller.numberController.text,
//                                       //       preName: dropdownvalue,
//                                       //       isAdd: '',
//                                       //     ),
//                                       //   );
//                                       // if (generateMafcontroller.generateMafFormKey.currentState!.validate()) {
//                                       //   final data = PostGenerateMafModel(
//                                       //     status: 1,
//                                       //     message: '',
//                                       //     data: Data(
//                                       //       id: 0,
//                                       //       approvalNumber: 0,
//                                       //       memberName: generateMafcontroller.nameController.text,
//                                       //       craeteDate: DateTime.parse(generateMafcontroller.dateInput.text),
//                                       //       welcomeFormNumber: '',
//                                       //       isMember: false,
//                                       //       mafNumber: generateMafcontroller.guestIdController.text,
//                                       //       dsaCode: '',
//                                       //       status: '',
//                                       //       mobileNumber: generateMafcontroller.numberController.text,
//                                       //       preName: dropdownvalue,
//                                       //       isAdd: '',
//                                       //     ),
//                                       //   );
//                                       print("object");
//                                       // print('Form data: ${data.toJson()}');
//                                       if (generateMafcontroller
//                                                   .nameController ==
//                                               null &&
//                                           generateMafcontroller
//                                                   .numberController ==
//                                               null &&
//                                           generateMafcontroller.dropdownvalue ==
//                                               null &&
//                                           generateMafcontroller.dateInput ==
//                                               null) {
//                                         Fluttertoast.showToast(
//                                           msg:
//                                               "Invalid, Please Enter all fields data",
//                                           backgroundColor: Colors.green,
//                                           textColor: Colors.white,
//                                           toastLength: Toast.LENGTH_LONG,
//                                           gravity: ToastGravity.CENTER,
//                                         );
//                                         Get.snackbar("Invalid",
//                                             "Please Enter all fields data",
//                                             backgroundColor: Colors.red,
//                                             colorText: Colors.white);
//                                       } else {
//                                         approvalFormController
//                                             .fetchApprovalForm();
//                                         approvalFormController
//                                             .fetchOnHoldApprovalForm();
//                                         generateMafcontroller
//                                             .checkGenerateMaf();
//                                       }
//                                       await Future.delayed(
//                                           Duration(seconds: 1));
//
//                                       generateMafcontroller.nameController ==
//                                           null;
//                                       generateMafcontroller.numberController ==
//                                           null;
//
//                                       print('Form fields saved successfully');
//                                       //  }
//                                     },
//                                     text: "Submit",
//                                     h: h / 17,
//                                     w: w / 3)),
//                             SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//             }));
//           }
//         }));
//   }
// }
