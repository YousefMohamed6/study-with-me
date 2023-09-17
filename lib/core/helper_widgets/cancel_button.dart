import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text_button.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: 'Cancel',
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
