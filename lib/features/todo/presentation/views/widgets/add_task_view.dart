import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/color_picker_view.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key, required this.taskCtrl, required this.formKey});
  final TextEditingController taskCtrl;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddTaskTextFeild(formKey: formKey, taskCtrl: taskCtrl),
          ColorPickerView(
            colors: BlocProvider.of<HomeCubit>(context).colors,
          ),
          const SizedBox(height: 16),
          AddTaskButton(formKey: formKey),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class AddTaskTextFeild extends StatelessWidget {
  const AddTaskTextFeild(
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

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<ToDoCubit>(context)
              .addTask(color: BlocProvider.of<HomeCubit>(context).color);
        }
      },
      color: Colors.white,
      child: const CustomText(
        text: 'Add',
        color: Colors.black,
      ),
    );
  }
}
