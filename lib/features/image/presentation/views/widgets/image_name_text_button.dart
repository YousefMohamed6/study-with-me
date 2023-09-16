import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_text_button.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/edit_image_name_view.dart';

class ImageNameTextButton extends StatelessWidget {
  const ImageNameTextButton({
    super.key,
    required this.image,
  });
  final ImageModel image;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
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
      text: image.imageName,
      color: Colors.white,
    );
  }
}
