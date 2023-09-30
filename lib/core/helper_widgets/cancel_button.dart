import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text_button.dart';
import 'package:studytome/generated/l10n.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: S.of(context).cancel,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
