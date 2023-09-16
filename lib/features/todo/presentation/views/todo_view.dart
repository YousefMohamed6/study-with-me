import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_list_view.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});
  static String id = 'ToDoView';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CustomAppBar(
          title: 'ToDo',
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ToDoListView(
            taskList: BlocProvider.of<ToDoCubit>(context).taskList,
          ),
        ),
      ],
    );
  }
}
