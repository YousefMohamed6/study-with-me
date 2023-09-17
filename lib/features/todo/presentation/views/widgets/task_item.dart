import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';
import 'package:studytome/features/todo/presentation/views/edit_tast_view.dart';
import 'package:studytome/features/todo/presentation/views/widgets/delete_task_button.dart';
import 'package:studytome/features/todo/presentation/views/widgets/task_name.dart';
import 'package:studytome/features/todo/presentation/views/widgets/task_state.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_background.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final ToDoModel task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          context: context,
          builder: EditTaskView(
            taskCtrl: BlocProvider.of<ToDoCubit>(context).taskCtrl,
            formKey: GlobalKey<FormState>(),
            task: task,
          ),
        );
      },
      child: ToDoBackground(
        color: task.color,
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          leading: TaskState(task: task),
          title: TaskName(task: task),
          trailing: DeleteTaskButton(task: task),
        ),
      ),
    );
  }
}
