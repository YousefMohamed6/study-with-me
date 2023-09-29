import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/generated/l10n.dart';

class BookFormFeild extends StatelessWidget {
  const BookFormFeild(
      {super.key, required this.controller, required this.formKey});
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFormField(
        controller: controller,
        lablelText: S.of(context).bookName,
      ),
    );
  }
}
