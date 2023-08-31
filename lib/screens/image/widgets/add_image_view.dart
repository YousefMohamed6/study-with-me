import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper/show_message.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_icon_button.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/image/cubit/image_cubit.dart';
import 'package:noteapp/screens/image/model/image_model.dart';

class AddImageView extends StatefulWidget {
  const AddImageView(
      {super.key, required this.controller, required this.formkey});
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;

  @override
  State<AddImageView> createState() => _AddImageViewState();
}

class _AddImageViewState extends State<AddImageView> {
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
              controller: widget.controller,
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
                icon: const Icon(
                  Icons.image,
                  size: 40,
                ),
              ),
              SizedBox(width: (MediaQuery.of(context).size.width) / 2),
              CustomIconButton(
                onPressed: () async {
                  imagePath =
                      await BlocProvider.of<ImageCubit>(context).pickerCamera();
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                ),
              ),
              const SizedBox(width: 32),
            ],
          ),
          const VerticalSizedBox(16),
          CustomButton(
            onPressed: () {
              if (widget.formkey.currentState!.validate()) {
                if (imagePath != null) {
                  BlocProvider.of<ImageCubit>(context).addImage(
                    ImageModel(
                      path: imagePath!,
                      name: widget.controller.text,
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  ShowMessage.show(context, msg: 'Please Select image');
                }
              }
            },
            color: Colors.white,
            child: const CustomText(
              text: 'Add',
              color: Colors.black,
            ),
          ),
          const VerticalSizedBox(8),
        ],
      ),
    );
  }
}
