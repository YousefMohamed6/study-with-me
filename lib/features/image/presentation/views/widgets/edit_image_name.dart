import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';

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
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: CustomFormField(
              controller: controller..text = image.name,
              lablelText: 'Image Name',
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ImageCubit>(context)
                    .editImageName(image: image);
                Navigator.pop(context);
              }
            },
            color: Colors.white,
            child: const CustomText(
              text: 'Save',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
