import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/todo/todo_cubit.dart';
import 'package:noteapp/model/todo_model.dart';
import 'package:noteapp/views/widgets/task_item.dart';

class ListViewTasks extends StatelessWidget {
  const ListViewTasks({
    super.key,
    required this.tasks,
  });
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskItem(
              task: tasks[index],
            ),
          ),
        );
      },
    );
  }
}
