import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/data/todo_model/todo_model.dart';
import 'package:studytome/features/todo/presentation/views/widgets/tasks_list_view_body.dart';
import 'package:studytome/generated/l10n.dart';

class ToDoListView extends StatelessWidget {
  const ToDoListView({
    super.key,
    required this.tasksList,
  });
  final List<ToDoModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoCubit, ToDoState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          ShowMessage.show(context, msg: S.of(context).addSuccess);
          Navigator.pop(context);
        } else if (state is AddTaskFailed) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        }
        if (state is EditTaskSuccess) {
          ShowMessage.show(context, msg: S.of(context).editSuccess);
          Navigator.pop(context);
        } else if (state is EditTaskFailed) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is ToDoSearch) {
          return ToDoListViewBody(tasksList: state.tasksList);
        } else {
          return ToDoListViewBody(
            tasksList: tasksList,
          );
        }
      },
    );
  }
}
