import 'package:flutter/material.dart';
import 'package:noteapp/helper/helper_widgets/custom_appbar.dart';
import 'package:noteapp/helper/helper_widgets/vertical_sizebox.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});
  static String id = 'Books';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSizedBox(16),
          CustomAppBar(
            title: 'Books',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
