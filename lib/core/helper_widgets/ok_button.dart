import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text_button.dart';
import 'package:studytome/generated/l10n.dart';

class OkButton extends StatelessWidget {
  const OkButton({super.key, required this.onPressOK});
  final VoidCallback onPressOK;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: S.of(context).ok,
      onPressed: () {
        onPressOK();
        Navigator.pop(context);
      },
    );
  }
}
