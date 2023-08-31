import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/image/cubit/image_cubit.dart';
import 'package:noteapp/screens/image/model/image_model.dart';

class EditImageName extends StatelessWidget {
  const EditImageName(
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
          const VerticalSizedBox(16),
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
          const VerticalSizedBox(8),
        ],
      ),
    );
  }
}
