import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_appbar.dart';

class FileView extends StatelessWidget {
  const FileView({super.key});
  static String id = 'Files';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
