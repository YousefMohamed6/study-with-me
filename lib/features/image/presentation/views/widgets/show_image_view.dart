import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              await Share.shareXFiles([XFile(image.path)]);
            },
          ),
        ],
      ),
      body: PhotoView(imageProvider: FileImage(File(image.path))),
    );
  }
}
