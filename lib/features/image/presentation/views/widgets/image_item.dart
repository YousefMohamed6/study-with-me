import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text_button.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/widgets/edit_image_name.dart';
import 'package:studytome/features/image/presentation/views/widgets/edit_image_view.dart';

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
        BlocProvider.of<HomeCubit>(context).showImage(image);
      },
      onTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          builder: EditImageView(
            controller: BlocProvider.of<ImageCubit>(context).imageCtrl,
            formkey: GlobalKey<FormState>(),
            image: image,
          ),
          context: context,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.file(
              File(image.path),
              fit: BoxFit.contain,
            ),
            Positioned(
              right: 1,
              top: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CustomIconButton(
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context).showAlertDialog(
                        context: context,
                        ok: () {
                          BlocProvider.of<ImageCubit>(context)
                              .deleteImage(image);
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            CustomTextButton(
              onPressed: () {
                BlocProvider.of<HomeCubit>(context).showBottomSheet(
                  context: context,
                  builder: EditImageNameView(
                    image: image,
                    controller: BlocProvider.of<ImageCubit>(context).imageCtrl,
                    formKey: GlobalKey<FormState>(),
                  ),
                );
              },
              text: image.name,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
