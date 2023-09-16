import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';
import 'package:studytome/features/image/presentation/views/widgets/action_image_button.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_form_feild.dart';

class EditImageNameView extends StatelessWidget {
  const EditImageNameView(
      {super.key,
      required this.image,
      required this.formKey,
      required this.controller});
  final ImageModel image;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageFormFeild(
            formKey: formKey,
            controller: controller..text = image.imageName,
          ),
          const SizedBox(height: 16),
          ActionImageButton(
            actionName: 'Save',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ImageCubit>(context)
                    .editImageName(image: image);
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
