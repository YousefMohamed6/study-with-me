import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';

class NoteContent extends StatelessWidget {
  const NoteContent({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: CustomText(
        text: content,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
