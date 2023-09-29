import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/delete_button.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';

class DeleteImageButton extends StatelessWidget {
  const DeleteImageButton({super.key, required this.image});
  final ImageModel image;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 1,
      top: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: DeleteButton(
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).showAlertDialog(
              context: context,
              onPressOk: () {
                BlocProvider.of<ImageCubit>(context)
                    .deleteImageFromMemory(image: image);
              },
            );
          },
        ),
      ),
    );
  }
}
