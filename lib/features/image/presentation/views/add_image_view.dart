import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/presentation/views/widgets/action_image_button.dart';
import 'package:studytome/features/image/presentation/views/widgets/image_form_feild.dart';
import 'package:studytome/features/image/presentation/views/widgets/picker_image_icon_buttons.dart';
import 'package:studytome/generated/l10n.dart';

class AddImageView extends StatelessWidget {
  const AddImageView(
      {super.key, required this.controller, required this.formKey});
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageFormFeild(
            controller: controller,
            formKey: formKey,
          ),
          const PickerImageIconButtons(),
          const SizedBox(height: 16),
          ActionImageButton(
            actionName: S.of(context).add,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ImageCubit>(context).addImageToMemory();
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
