import 'package:flutter/material.dart';
import 'package:noteapp/helper/helper_widgets/custom_appbar.dart';
import 'package:noteapp/helper/helper_widgets/vertical_sizebox.dart';

class FileView extends StatelessWidget {
  const FileView({super.key});
  static String id = 'Files';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSizedBox(16),
          CustomAppBar(
            title: 'Files',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
