import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class EditNote extends StatelessWidget {
  const EditNote({
    super.key,
    required this.title,
    required this.contant,
    required this.formKey,
  });
  final String title;
  final String contant;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFormField(
            controller: TextEditingController(text: title),
            lablelText: 'Title',
          ),
          CustomFormField(
            controller: TextEditingController(text: contant),
            lablelText: 'content',
            maxLine: 5,
          ),
          const VerticalSizedBox(24),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              }
            },
            child: const CustomText(text: 'Save'),
          )
        ],
      ),
    );
  }
}
