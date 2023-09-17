import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/color_picker_view.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView(
      {super.key,
      required this.taskCtrl,
      required this.formKey,
      required this.task});
  final TextEditingController taskCtrl;
  final GlobalKey<FormState> formKey;
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EditTaskTextFeild(
            formKey: formKey,
            taskCtrl: taskCtrl,
            taskName: task.taskName,
          ),
          const SizedBox(height: 8),
          ColorPickerView(
            colors: BlocProvider.of<HomeCubit>(context).colors,
          ),
          const SizedBox(height: 8),
          SaveEditTaskButton(formKey: formKey, task: task),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class EditTaskTextFeild extends StatelessWidget {
  const EditTaskTextFeild(
      {super.key,
      required this.formKey,
      required this.taskCtrl,
      required this.taskName});
  final GlobalKey<FormState> formKey;
  final TextEditingController taskCtrl;
  final String taskName;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFormField(
        controller: taskCtrl..text = taskName,
        hintText: 'Enter your Task',
        maxLine: 1,
      ),
    );
  }
}

class SaveEditTaskButton extends StatelessWidget {
  const SaveEditTaskButton(
      {super.key, required this.formKey, required this.task});
  final GlobalKey<FormState> formKey;
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.white,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          BlocProvider.of<ToDoCubit>(context).editTaskName(
              task: task, color: BlocProvider.of<HomeCubit>(context).color);
        }
      },
      child: const CustomText(
        text: 'Save',
        color: Colors.black,
      ),
    );
  }
}
