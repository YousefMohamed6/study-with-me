import 'package:flutter/material.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/image/model/image_model.dart';

class ShowImageView extends StatelessWidget {
  const ShowImageView({super.key, required this.image});
  final ImageModel image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(text: 'image test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/avater.png'),
        ),
      ),
    );
  }
}
