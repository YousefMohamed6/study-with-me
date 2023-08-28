import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class ToDoSheet extends StatelessWidget {
  const ToDoSheet({super.key, required this.taskCtrl, required this.formKey});
  final TextEditingController taskCtrl;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: CustomFormField(
                controller: taskCtrl,
                hintText: 'Enter your Task',
                maxLine: 1,
              ),
            ),
            const VerticalSizedBox(16),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              color: Colors.white,
              child: const CustomText(
                text: 'add',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
