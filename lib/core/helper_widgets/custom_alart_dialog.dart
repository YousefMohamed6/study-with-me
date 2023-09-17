import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/cancel_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/core/helper_widgets/ok_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.onPressOk});
  final VoidCallback onPressOk;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomText(text: "Alert"),
      content: const CustomText(text: "Do you like to delete it"),
      actions: [
        const CancelButton(),
        OkButton(onPressOK: onPressOk),
      ],
    );
  }
}
