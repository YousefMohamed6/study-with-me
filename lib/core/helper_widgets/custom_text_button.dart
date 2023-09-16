import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontWeight,
    this.color,
    this.fontSize,
  });
  final String text;
  final void Function() onPressed;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
