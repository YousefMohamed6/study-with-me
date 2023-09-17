import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';

class TaskName extends StatelessWidget {
  const TaskName({super.key, required this.task});
  final ToDoModel task;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: task.taskName,
      fontWeight: FontWeight.bold,
      decoration: task.isComplete ? TextDecoration.lineThrough : null,
    );
  }
}
