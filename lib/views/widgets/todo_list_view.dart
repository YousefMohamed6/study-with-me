import 'package:flutter/material.dart';
import 'package:noteapp/model/todo_model.dart';
import 'package:noteapp/views/widgets/todo_item.dart';

class ListViewTasks extends StatelessWidget {
  const ListViewTasks({
    super.key,
    required this.tasks,
  });
  final List<ToDoModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: tasks.length,
        itemBuilder: (context, index) => ToDoItem(
          title: tasks[index].taskNames,
          isComplete: tasks[index].isComplete,
        ),
      ),
    );
  }
}
