import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/edit_image_view.dart';
import 'package:studytome/features/image/presentation/views/widgets/delete_image_button.dart';
import 'package:studytome/features/image/presentation/views/widgets/picture.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_name_text_button.dart';

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
        BlocProvider.of<HomeCubit>(context).showImageView(image: image);
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
      child: Picture(
        imagePath: image.imagePath,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DeleteImageButton(image: image),
            ImageNameTextButton(image: image),
          ],
        ),
      ),
    );
  }
}
