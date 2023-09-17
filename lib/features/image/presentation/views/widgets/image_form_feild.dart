import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';

class ImageFormFeild extends StatelessWidget {
  const ImageFormFeild({
    super.key,
    required this.formKey,
    required this.controller,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFormField(
        controller: controller,
        lablelText: 'Picture Name',
      ),
    );
  }
}
