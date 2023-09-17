import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_list_view.dart';

class ToDoViewBody extends StatelessWidget {
  const ToDoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: 'ToDo',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          ToDoListView(
            tasksList: BlocProvider.of<ToDoCubit>(context).taskList,
          ),
        ],
      ),
    );
  }
}
