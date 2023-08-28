import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/navigatorbar/navigatore_cubit.dart';
import 'package:noteapp/cubits/note/note_cubit.dart';
import 'package:noteapp/cubits/todo/todo_cubit.dart';
import 'package:noteapp/views/screens/books_view.dart';
import 'package:noteapp/views/screens/file_view.dart';
import 'package:noteapp/views/screens/note_view.dart';
import 'package:noteapp/views/screens/todo_view.dart';
import 'package:noteapp/views/widgets/navigationbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigatoreBarState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(Icons.add, size: 32),
            onPressed: () {
              if (state is File) {
              } else if (state is Note) {
                BlocProvider.of<NoteCubit>(context).showBottomSheet(context);
              } else if (state is ToDo) {
                BlocProvider.of<ToDoCubit>(context).showBottomSheet(context);
              } else {}
            },
          ),
          bottomNavigationBar: CustombottomBar(
            currentIndex:
                BlocProvider.of<NavigationBarCubit>(context).currentIndex,
          ),
          body: BlocBuilder<NavigationBarCubit, NavigatoreBarState>(
            builder: (context, state) {
              if (state is File) {
                return const FileView();
              } else if (state is Note) {
                return const NoteView();
              } else if (state is ToDo) {
                return const ToDoView();
              } else {
                return const BookView();
              }
            },
          ),
        );
      },
    );
  }
}
