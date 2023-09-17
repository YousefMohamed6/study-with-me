import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/app_bar_title.dart';
import 'package:studytome/core/helper_widgets/search_icon.dart';

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
          AppBarTitle(title: title),
          SearchIcon(onPressed: onPressed),
        ],
      ),
    );
  }
}
