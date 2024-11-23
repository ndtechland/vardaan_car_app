import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DriverToggleButton extends StatelessWidget {
  final RxBool isSwitchOn;
  final Function(bool) onConfirm;

  const DriverToggleButton({
    required this.isSwitchOn,
    required this.onConfirm,
    Key? key,
  }) : super(key: key);

  void _showPowerDialog(BuildContext context, bool newState) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Action'),
          content: Text(
            newState
                ? 'Do you want to turn the driver ON?'
                : 'Do you want to turn the driver OFF?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog without changes
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                onConfirm(newState); // Update state
                Navigator.pop(context); // Close dialog
              },

              ///todo:.......:.....:....:......:....:....:....:....:....:....:.....:....:....:....:...
              child: Text('Yes'),
              //
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: Icon(
          isSwitchOn.value ? Icons.lightbulb_outline : Icons.power_settings_new,
          color: isSwitchOn.value ? Colors.green : Colors.red,
          size: 27,
        ),
        onPressed: () {
          _showPowerDialog(context, !isSwitchOn.value);
        },
      ),
    );
  }
}
