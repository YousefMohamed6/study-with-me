import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.05),
      ),
      child: CustomText(
        text: title,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
