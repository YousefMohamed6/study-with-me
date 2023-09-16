import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(.05),
            ),
            child: CustomIconButton(
              icon: const Icon(Icons.search),
              iconSize: 32,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
