import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper/helper_widgets/custom_text_button.dart';
import 'package:noteapp/helper_widgets/custom_icon_button.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/image/cubit/image_cubit.dart';
import 'package:noteapp/screens/image/model/image_model.dart';
import 'package:noteapp/screens/image/widgets/edit_image_view.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.image,
  });
  final ImageModel image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          builder: EditImageView(
              controller: BlocProvider.of<ImageCubit>(context).imageCtrl,
              formkey: GlobalKey<FormState>(),
              image: image),
          context: context,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height) / 2,
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.file(
                  File(image.path),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 1,
                  top: 1,
                  child: CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: CustomTextButton(
                    text: image.name,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
