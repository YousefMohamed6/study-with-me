import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/intial_appbar.dart';
import 'package:studytome/core/helper_widgets/search_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.isTapSearch});
  final String title;
  final bool isTapSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: isTapSearch ? const SearchView() : IntialAppBarView(title: title),
    );
  }
}
