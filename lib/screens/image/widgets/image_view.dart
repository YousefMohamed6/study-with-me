import 'package:flutter/material.dart';
import 'package:noteapp/helper/helper_widgets/custom_appbar.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key});
  static String id = 'Files';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSizedBox(16),
          CustomAppBar(
            title: 'Images',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
