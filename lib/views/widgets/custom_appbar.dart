import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_icon_button.dart';
import 'package:noteapp/views/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(.05),
            ),
            child: CustomIconButton(
              icon: icon,
              iconSize: 32,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
