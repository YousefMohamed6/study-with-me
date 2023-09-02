import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/screens/todo/todo_cubit/todo_cubit.dart';
import 'package:noteapp/screens/todo/todo_model/todo_model.dart';

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
          const VerticalSizedBox(16),
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
          const VerticalSizedBox(16),
        ],
      ),
    );
  }
}
