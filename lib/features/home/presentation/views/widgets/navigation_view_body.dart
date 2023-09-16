import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/presentation/views/book_view.dart';
import 'package:studytome/features/contact_us/views/contact_us_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/presentation/views/image_view.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/note_view.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/presentation/views/todo_view.dart';

class NavigationViewBody extends StatelessWidget {
  const NavigationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is Book) {
          BlocProvider.of<BookCubit>(context).fetchBooks();
          return const BookView();
        } else if (state is Note) {
          BlocProvider.of<NoteCubit>(context).fetchNotes();
          return const NoteView();
        } else if (state is ToDo) {
          BlocProvider.of<ToDoCubit>(context).fetchTasks();
          return const ToDoView();
        } else if (state is Images) {
          BlocProvider.of<ImageCubit>(context).fetchImages();
          return const ImagesView();
        } else {
          return const ContactUsView();
        }
      },
    );
  }
}
