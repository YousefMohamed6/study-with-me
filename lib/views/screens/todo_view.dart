import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/ui/todo/todo_cubit/todo_cubit.dart';
import 'package:noteapp/views/widgets/custom_appbar.dart';
import 'package:noteapp/ui/todo/todo_list_view.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});
  static String id = 'ToDoView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSizedBox(24),
          CustomAppBar(
            title: 'ToDo',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const VerticalSizedBox(16),
          Expanded(
            child: ListViewTasks(
              tasks: BlocProvider.of<ToDoCubit>(context).tasks,
            ),
          ),
        ],
      ),
    );
  }
}
