import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/intial_appbar.dart';
import 'package:studytome/core/helper_widgets/search_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.isTapSearch, required this.onChanged});
  final String title;
  final bool isTapSearch;
  final void Function(String) onChanged;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: isTapSearch ?  SearchView(onChanged: onChanged,) : IntialAppBarView(title: title),
    );
  }
}
