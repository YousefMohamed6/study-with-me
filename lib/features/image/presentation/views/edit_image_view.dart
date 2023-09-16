import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/widgets/action_image_button.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_form_feild.dart';
import 'package:studytome/features/image/presentation/views/widgets/picker_image_icon_buttons.dart';

class EditImageView extends StatelessWidget {
  const EditImageView(
      {super.key,
      required this.controller,
      required this.formkey,
      required this.image});
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;
  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageFormFeild(
            controller: controller..text = image.imageName,
            formKey: formkey,
          ),
          const PickerImageIconButtons(),
          const SizedBox(height: 16),
          ActionImageButton(
            actionName: 'Save',
            onPressed: () {
              if (formkey.currentState!.validate()) {
                BlocProvider.of<ImageCubit>(context)
                    .editImagePath(image: image);
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
