import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';

class DeleteTaskButton extends StatelessWidget {
  const DeleteTaskButton({super.key, required this.task});
  final ToDoModel task;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      icon: const Icon(Icons.delete),
      onPressed: () {
        BlocProvider.of<HomeCubit>(context).showAlertDialog(
          context: context,
          onPressOk: () {
            BlocProvider.of<ToDoCubit>(context).deleteTask(task: task);
          },
        );
      },
    );
  }
}
