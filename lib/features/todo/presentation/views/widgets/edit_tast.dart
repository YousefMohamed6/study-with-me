import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
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
          Form(
            key: formKey,
            child: CustomFormField(
              controller: taskCtrl..text = task.taskNames,
              hintText: 'Enter your Task',
              maxLine: 1,
            ),
          ),
          const SizedBox(height: 8),
          BlocProvider.of<HomeCubit>(context).colorPicker(),
          const SizedBox(height: 8),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<ToDoCubit>(context).editTaskName(
                    task: task,
                    color: BlocProvider.of<NoteCubit>(context).color);
                ShowMessage.show(context, msg: 'Edit Success');
              }
            },
            color: Colors.white,
            child: const CustomText(
              text: 'Save',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
