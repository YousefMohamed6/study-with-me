import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_appbar.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class EditNote extends StatelessWidget {
  const EditNote(
      {super.key, required this.titController, required this.subController});
  final TextEditingController titController;
  final TextEditingController subController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAppBar(
            title: 'Edit Note',
            icon: Icon(Icons.done),
          ),
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
        ],
      ),
    );
  }
}
