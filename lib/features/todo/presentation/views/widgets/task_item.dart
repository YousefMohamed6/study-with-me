import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';
import 'package:studytome/features/todo/presentation/views/widgets/edit_tast.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          context: context,
          builder: EditTaskView(
            taskCtrl: BlocProvider.of<ToDoCubit>(context).taskCtrl,
            formKey: GlobalKey<FormState>(),
            task: task,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 24.0, left: 24.0, right: 16),
        margin: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(task.color),
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          leading: CustomIconButton(
            icon: Icon(
              task.isComplete ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            onPressed: () {
              BlocProvider.of<ToDoCubit>(context).editTaskState(task: task);
            },
          ),
          title: CustomText(
            text: task.taskNames,
            fontWeight: FontWeight.bold,
            decoration: task.isComplete ? TextDecoration.lineThrough : null,
          ),
          trailing: CustomIconButton(
            iconSize: 32,
            icon: const Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<HomeCubit>(context).showAlertDialog(
                context: context,
                ok: () {
                  BlocProvider.of<ToDoCubit>(context).deleteTask(task: task);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
