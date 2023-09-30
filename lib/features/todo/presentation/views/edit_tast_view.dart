import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/color_picker_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_action_button.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_form_field.dart';
import 'package:studytome/generated/l10n.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView(
      {super.key,
      required this.taskCtrl,
      required this.formKey,
      required this.task});
  final TextEditingController taskCtrl;
  final GlobalKey<FormState> formKey;
  final ToDoModel task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ToDoFormFeild(
            formKey: formKey,
            taskCtrl: taskCtrl..text = task.taskName,
          ),
          const SizedBox(height: 8),
          ColorPickerView(
            colors: BlocProvider.of<HomeCubit>(context).colors,
          ),
          const SizedBox(height: 8),
          ToDoActionButton(
            actionName: S.of(context).save,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<ToDoCubit>(context).editTaskName(
                    task: task,
                    color: BlocProvider.of<HomeCubit>(context).color);
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
