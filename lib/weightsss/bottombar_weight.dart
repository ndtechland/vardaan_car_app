import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 8,
              width: 50,
              color: Colors.black87,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Name: Kumar Prince',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Email: kumarprince@gmail.com',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Phone Num: +91 8465128454',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the bottom sheet
              },
              child: const Text('Close BottomSheet'),
            ),
          ),
        ],
      ),
    );
  }
}
