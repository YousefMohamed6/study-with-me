import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_appbar.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class EditNote extends StatelessWidget {
  static String id = 'EditNote';
  const EditNote(
      {super.key, required this.titleCtrl, required this.contentCtrl});
  final TextEditingController titleCtrl;
  final TextEditingController contentCtrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: const Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const VerticalSizedBox(50),
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
        ],
      ),
    );
  }
}
