import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';

class ToDoFormFeild extends StatelessWidget {
  const ToDoFormFeild(
      {super.key, required this.formKey, required this.taskCtrl});
  final GlobalKey<FormState> formKey;
  final TextEditingController taskCtrl;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFormField(
        controller: taskCtrl,
        hintText: 'Enter your Task',
        maxLine: 1,
      ),
    );
  }
}
