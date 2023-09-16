import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';
import 'package:studytome/features/todo/presentation/views/widgets/task_item.dart';

class ToDoListView extends StatelessWidget {
  const ToDoListView({
    super.key,
    required this.taskList,
  });
  final List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDoState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          ShowMessage.show(context, msg: 'Success');
          Navigator.pop(context);
        } else if (state is AddTaskFailed) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        } else if (state is EditTaskSuccess) {
          ShowMessage.show(context, msg: 'Edit Success');
          Navigator.pop(context);
        } else if (state is EditTaskFailed) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: taskList.length,
            itemBuilder: (context, index) => TaskItem(
              task: taskList[index],
            ),
          ),
        );
      },
    );
  }
}
