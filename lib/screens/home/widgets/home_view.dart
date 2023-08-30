import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/screens/books/widgets/books_view.dart';
import 'package:noteapp/screens/files/widgets/file_view.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/home/widgets/navigationbar.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/screens/note/widgets/add_note.dart';
import 'package:noteapp/screens/note/widgets/note_view.dart';
import 'package:noteapp/screens/todo/todo_cubit/todo_cubit.dart';
import 'package:noteapp/screens/todo/widgets/add_task.dart';
import 'package:noteapp/screens/todo/widgets/todo_view.dart';
import 'package:noteapp/screens/youtube/webview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is Youtube) {
          return const WebViewApp(url: 'https://www.youtube.com/');
        } else {
          return Scaffold(
            floatingActionButton: state is AddColors
                ? BlocProvider.of<HomeCubit>(context).colorPicker(
                    onPressed: () {
                      BlocProvider.of<HomeCubit>(context).showBottomSheet(
                        context,
                        builder: AddNoteSheet(
                          titleCtrl:
                              BlocProvider.of<NoteCubit>(context).titleCtrl,
                          contentCtrl:
                              BlocProvider.of<NoteCubit>(context).contentCtrl,
                          formkey: GlobalKey<FormState>(),
                          color: BlocProvider.of<NoteCubit>(context).color,
                        ),
                      );
                    },
                  )
                : FloatingActionButton(
                    backgroundColor: Colors.white.withOpacity(0.25),
                    child: const Icon(
                      Icons.add,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (state is File) {
                      } else if (state is Note) {
                        BlocProvider.of<NoteCubit>(context).fetshNotes();
                        BlocProvider.of<NoteCubit>(context).addColor();
                        BlocProvider.of<HomeCubit>(context).refresh();
                      } else if (state is ToDo) {
                        BlocProvider.of<HomeCubit>(context).showBottomSheet(
                            context,
                            builder: AddTaskView(
                                taskCtrl: BlocProvider.of<ToDoCubit>(context)
                                    .taskCtrl,
                                formKey: GlobalKey<FormState>()));
                      } else {}
                    },
                  ),
            bottomNavigationBar: CustombottomBar(
              currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is File) {
                  return const FileView();
                } else if (state is Note) {
                  BlocProvider.of<NoteCubit>(context).fetshNotes();
                  return const NoteView();
                } else if (state is ToDo) {
                  BlocProvider.of<ToDoCubit>(context).fetchTasks();
                  return const ToDoView();
                } else {
                  return const BookView();
                }
              },
            ),
          );
        }
      },
    );
  }
}
