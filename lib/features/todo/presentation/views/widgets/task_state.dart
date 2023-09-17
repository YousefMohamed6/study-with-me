import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';

class TaskState extends StatelessWidget {
  const TaskState({super.key, required this.task});
  final ToDoModel task;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        task.isComplete ? Icons.check_box : Icons.check_box_outline_blank,
      ),
      onPressed: () {
        BlocProvider.of<ToDoCubit>(context).editTaskState(task: task);
      },
    );
  }
}
