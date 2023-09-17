import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/presentation/views/add_book_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/presentation/views/add_image_view.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/add_note_view.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/presentation/views/add_task_view.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.state});
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white.withOpacity(0.25),
      child: const Icon(
        Icons.add,
        size: 24,
        color: Colors.white,
      ),
      onPressed: () {
        if (state is Book) {
          BlocProvider.of<HomeCubit>(context).showBottomSheet(
            context: context,
            builder: AddBookView(
              controller: BlocProvider.of<BookCubit>(context).bookCtrl,
              formKey: GlobalKey<FormState>(),
            ),
          );
        } else if (state is Images) {
          BlocProvider.of<HomeCubit>(context).showBottomSheet(
            context: context,
            builder: AddImageView(
              controller: BlocProvider.of<ImageCubit>(context).imageCtrl,
              formKey: GlobalKey<FormState>(),
            ),
          );
        } else if (state is Note) {
          BlocProvider.of<HomeCubit>(context).showBottomSheet(
            context: context,
            builder: AddNoteView(
              titleCtrl: BlocProvider.of<NoteCubit>(context).titleCtrl,
              contentCtrl: BlocProvider.of<NoteCubit>(context).contentCtrl,
              formkey: GlobalKey<FormState>(),
            ),
          );
        } else if (state is ToDo) {
          BlocProvider.of<HomeCubit>(context).showBottomSheet(
            context: context,
            builder: AddTaskView(
              taskCtrl: BlocProvider.of<ToDoCubit>(context).taskCtrl,
              formKey: GlobalKey<FormState>(),
            ),
          );
        }
      },
    );
  }
}
