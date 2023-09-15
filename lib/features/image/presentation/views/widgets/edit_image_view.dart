import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/data/model/image_model.dart';

class EditImageView extends StatefulWidget {
  const EditImageView(
      {super.key,
      required this.controller,
      required this.formkey,
      required this.image});
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;
  final ImageModel image;

  @override
  State<EditImageView> createState() => _EditImageViewState();
}

class _EditImageViewState extends State<EditImageView> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: widget.formkey,
            child: CustomFormField(
              controller: widget.controller..text = widget.image.name,
              lablelText: 'Image Name',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 32),
              CustomIconButton(
                onPressed: () async {
                  imagePath = await BlocProvider.of<ImageCubit>(context)
                      .pickerGallery();
                },
                icon: const Icon(Icons.image, size: 40),
              ),
              SizedBox(width: (MediaQuery.of(context).size.width) / 2),
              CustomIconButton(
                onPressed: () async {
                  imagePath =
                      await BlocProvider.of<ImageCubit>(context).pickerCamera();
                },
                icon: const Icon(Icons.camera_alt_outlined, size: 40),
              ),
              const SizedBox(width: 32),
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              if (widget.formkey.currentState!.validate()) {
                if (imagePath != null) {
                  BlocProvider.of<ImageCubit>(context).editImage(
                      imagePath: imagePath!,
                      imageName: widget.controller.text,
                      image: widget.image);
                  Navigator.pop(context);
                } else {
                  ShowMessage.show(context, msg: 'Please Select image');
                }
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
