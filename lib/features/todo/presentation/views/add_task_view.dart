import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/color_picker_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_action_button.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_form_field.dart';

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
          ToDoFormFeild(formKey: formKey, taskCtrl: taskCtrl),
          ColorPickerView(
            colors: BlocProvider.of<HomeCubit>(context).colors,
          ),
          const SizedBox(height: 16),
          ToDoActionButton(
            actionName: 'Add',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<ToDoCubit>(context)
                    .addTask(color: BlocProvider.of<HomeCubit>(context).color);
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
