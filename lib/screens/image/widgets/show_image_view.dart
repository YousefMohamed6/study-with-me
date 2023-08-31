import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/image/model/image_model.dart';

class ShowImageView extends StatelessWidget {
  const ShowImageView({super.key, required this.image});
  final ImageModel image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).changeIndex(1);
          },
        ),
        centerTitle: true,
        title: CustomText(text: image.name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.file(File(image.path)),
        ),
      ),
    );
  }
}
