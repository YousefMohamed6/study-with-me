import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class NoteSheet extends StatelessWidget {
  static String id = 'NoteSheet';
  const NoteSheet(
      {super.key,
      required this.titleCtrl,
      required this.contentCtrl,
      required this.formkey});
  final TextEditingController titleCtrl;
  final TextEditingController contentCtrl;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormField(
              controller: titleCtrl,
              lablelText: 'Title',
            ),
            CustomFormField(
              controller: contentCtrl,
              lablelText: 'Content',
              maxLine: 10,
            ),
            const VerticalSizedBox(24),
            CustomButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
              color: Colors.white,
              child: const CustomText(text: 'Save', color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
