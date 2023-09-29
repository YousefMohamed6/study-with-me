import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';

class ToDoActionButton extends StatelessWidget {
  const ToDoActionButton(
      {super.key, required this.onPressed, required this.actionName});

  final VoidCallback onPressed;
  final String actionName;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      child: const CustomText(
        text: 'Add',
      ),
    );
  }
}
