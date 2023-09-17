import 'package:flutter/material.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';
import 'package:studytome/features/todo/presentation/views/widgets/task_item.dart';

class ToDoListViewBody extends StatelessWidget {
  const ToDoListViewBody({super.key, required this.tasksList});
  final List<ToDoModel> tasksList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: tasksList.length,
        itemBuilder: (context, index) => TaskItem(
          task: tasksList[index],
        ),
      ),
    );
  }
}
