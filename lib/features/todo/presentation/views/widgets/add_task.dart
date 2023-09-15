import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';

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
          Form(
            key: formKey,
            child: CustomFormField(
              controller: taskCtrl,
              hintText: 'Enter your Task',
              maxLine: 1,
            ),
          ),
          BlocProvider.of<HomeCubit>(context).colorPicker(),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ToDoCubit>(context).addTask(
                  TaskModel(
                      isComplete: false,
                      taskNames: taskCtrl.text,
                      color: BlocProvider.of<NoteCubit>(context).color),
                );
              }
            },
            color: Colors.white,
            child: const CustomText(
              text: 'Add',
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
