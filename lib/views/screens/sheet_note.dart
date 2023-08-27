import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class SheetNote extends StatelessWidget {
  const SheetNote(
      {super.key, required this.titController, required this.subController});
  final TextEditingController titController;
  final TextEditingController subController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFormField(
            controller: titController,
            lablelText: 'Title',
          ),
          CustomFormField(
            controller: subController,
            lablelText: 'Content',
            maxLine: 10,
          ),
          const VerticalSizedBox(24),
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            child: const CustomText(text: 'Save', color: Colors.black),
          ),
        ],
      ),
    );
  }
}
