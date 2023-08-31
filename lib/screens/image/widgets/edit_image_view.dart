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
    return BlocListener<ImageCubit, ImageState>(
      listener: (context, state) {
        if (state is PickImageSuccess) {
          ShowMessage.show(context, msg: 'Pick image Success');
        } else if (state is PickImageFailure) {
          ShowMessage.show(context, msg: 'Pick image faild');
          Navigator.pop(context);
        } else if (state is EditImageSuccess) {
          ShowMessage.show(context, msg: 'Edit image Success');
          Navigator.pop(context);
        } else if (state is EditImageFailure) {
          ShowMessage.show(context, msg: 'faild ,try again');
          Navigator.pop(context);
        }
      },
      child: Padding(
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
                    imagePath = await BlocProvider.of<ImageCubit>(context)
                        .pickerCamera();
                  },
                  icon: const Icon(Icons.camera_alt_outlined, size: 40),
                ),
                const SizedBox(width: 32),
              ],
            ),
            const VerticalSizedBox(16),
            CustomButton(
              onPressed: () {
                if (widget.formkey.currentState!.validate()) {
                  BlocProvider.of<ImageCubit>(context).editImage(
                      imagePath: imagePath!,
                      imageName: widget.controller.text,
                      image: widget.image);
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
      ),
    );
  }
}
