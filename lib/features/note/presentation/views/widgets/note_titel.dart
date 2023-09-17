import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title,
      fontWeight: FontWeight.bold,
    );
  }
}
