import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_icon_button.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/image/cubit/image_cubit.dart';
import 'package:noteapp/screens/image/model/image_model.dart';
import 'package:noteapp/screens/image/widgets/edit_image_name.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Image.file(
                  File(image.path),
                  width: 100,
                  height: 200,
                ),
              ),
              CustomIconButton(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).showAlertDialog(
                    context: context,
                    ok: () {
                      BlocProvider.of<ImageCubit>(context).deleteImage(image);
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          CustomIconButton(
            onPressed: () {
              BlocProvider.of<HomeCubit>(context).showBottomSheet(
                context: context,
                builder: EditImageName(
                  image: image,
                  controller: BlocProvider.of<ImageCubit>(context).imageCtrl,
                  formKey: GlobalKey<FormState>(),
                ),
              );
            },
            icon: CustomText(text: image.name),
          ),
        ],
      ),
    );
  }
}
