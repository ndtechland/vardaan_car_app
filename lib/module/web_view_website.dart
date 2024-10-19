// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
// class WebViewwebsitess extends StatefulWidget {
//   final String url;
//
//   const WebViewwebsitess({Key? key, required this.url}) : super(key: key);
//
//   @override
//   State<WebViewwebsitess> createState() => _WebViewwebsitessState();
// }
//
// class _WebViewwebsitessState extends State<WebViewwebsitess> {
//   double _progress = 0;
//   late InAppWebViewController inAppWebViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return WillPopScope(
//       onWillPop: () async {
//         var isLastPage = await inAppWebViewController.canGoBack();
//         if (isLastPage) {
//           inAppWebViewController.goBack();
//           return false;
//         }
//         return true;
//       },
//       child: SafeArea(
//         child: Scaffold(
//           // appBar: AppBar(
//           //   backgroundColor: AppColors.a15,
//           //   centerTitle: true,
//           //   // leading: Material(
//           //   //   elevation: 0,
//           //   //   // color: Colors.black12,
//           //   //   //shadowColor: Colors.grey.shade100,
//           //   //   borderRadius: BorderRadius.circular(100),
//           //   //   child: Container(
//           //   //     height: size.height * 0.04,
//           //   //     width: size.width * 0.08,
//           //   //     decoration: BoxDecoration(
//           //   //         //shape: BoxShape.circle,
//           //   //         color: AppColors.a15,
//           //   //         image: DecorationImage(
//           //   //             image: AssetImage('lib/assets/video/contact.gif'
//           //   //                 //'lib/assets/video/right-arrow.gif'
//           //   //                 ),
//           //   //             fit: BoxFit.fitWidth)),
//           //   //     // child: Image.asset('lib/assets/images/right-arrow.gif')
//           //   //   ),
//           //   // ),
//           //   ///
//           //   // Icon(
//           //   //   Icons.support_agent,
//           //   //   color: Colors.white,
//           //   //   size: size.width * 0.09,
//           //   // ),
//           //   title: Container(
//           //     height: size.height * 0.05,
//           //     width: size.width * 0.2,
//           //     decoration: BoxDecoration(
//           //         image: DecorationImage(
//           //             image:
//           //                 AssetImage('lib/assets/video/suvidha33logo.jpeg'))),
//           //   ),
//           //
//           //   //Text("Suvidha"),
//           // ),
//           ///
//           // AppBar(
//           //   elevation: 0,
//           //   title: const Text('SUVIDHA'),
//           //   backgroundColor: Colors.cyan,
//           //   centerTitle: true,
//           // ),
//           body: Stack(
//             children: [
//               InAppWebView(
//                 initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
//                 onWebViewCreated: (InAppWebViewController controller) {
//                   inAppWebViewController = controller;
//                 },
//                 onProgressChanged:
//                     (InAppWebViewController controller, int progress) {
//                   setState(() {
//                     _progress = progress / 100;
//                   });
//                 },
//               ),
//               _progress < 1
//                   ? Container(
//                       color: Colors.white,
//                       child: Center(
//                         child: CircularProgressIndicator(
//                           value: _progress,
//                         ),
//                       ),
//                     )
//                   : SizedBox()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///
///
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class WebViewwebsitess extends StatefulWidget {
//   final String url;
//
//   const WebViewwebsitess({Key? key, required this.url}) : super(key: key);
//
//   @override
//   State<WebViewwebsitess> createState() => _WebViewwebsitessState();
// }
//
// class _WebViewwebsitessState extends State<WebViewwebsitess> {
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _launchURL();
//   }
//
//   Future<void> _launchURL() async {
//     if (await canLaunchUrl(Uri.parse(widget.url))) {
//       await launchUrl(Uri.parse(widget.url),
//           mode: LaunchMode.externalApplication);
//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       throw 'Could not launch ${widget.url}';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _isLoading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
