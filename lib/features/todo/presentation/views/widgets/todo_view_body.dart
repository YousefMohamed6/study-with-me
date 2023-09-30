import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/presentation/views/widgets/todo_list_view.dart';
import 'package:studytome/generated/l10n.dart';

class ToDoViewBody extends StatelessWidget {
  const ToDoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<ToDoCubit, ToDoState>(
            builder: (context, state) {
              return CustomAppBar(
                onChanged: (input) {
                  BlocProvider.of<ToDoCubit>(context).searchTask(input: input);
                },
                title: S.of(context).todo,
                isTapSearch: BlocProvider.of<HomeCubit>(context).isTapSearch,
              );
            },
          ),
          const SizedBox(height: 16),
          ToDoListView(
            tasksList: BlocProvider.of<ToDoCubit>(context).tasksList,
          ),
        ],
      ),
    );
  }
}
