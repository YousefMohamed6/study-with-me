import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/generated/l10n.dart';

class ContentFormFeild extends StatelessWidget {
  const ContentFormFeild({super.key, required this.contentCtrl});
  final TextEditingController contentCtrl;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller: contentCtrl,
      lablelText: S.of(context).content,
      maxLine: 5,
    );
  }
}
