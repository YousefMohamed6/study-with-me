import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/navigatorbar/navigatore_cubit.dart';
import 'package:noteapp/ui/note/note_cubit/note_cubit.dart';
import 'package:noteapp/ui/note/note_sheet.dart';
import 'package:noteapp/ui/todo/add_task.dart';
import 'package:noteapp/ui/todo/todo_cubit/todo_cubit.dart';
import 'package:noteapp/views/screens/books_view.dart';
import 'package:noteapp/views/screens/file_view.dart';
import 'package:noteapp/views/screens/note_view.dart';
import 'package:noteapp/views/screens/todo_view.dart';
import 'package:noteapp/views/screens/webview.dart';
import 'package:noteapp/views/widgets/navigationbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
      builder: (context, state) {
        if (state is Youtube) {
          return const WebViewApp(url: 'https://www.youtube.com/');
        } else {
          return Scaffold(
            floatingActionButton: state is AddColors
                ? BlocProvider.of<NoteCubit>(context).colorPicker(
                    onPressed: () {
                      BlocProvider.of<NoteCubit>(context).showAddNoteSheet(
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
                        BlocProvider.of<NavigationBarCubit>(context).refresh();
                      } else if (state is ToDo) {
                        BlocProvider.of<ToDoCubit>(context).showBottomSheet(
                            context,
                            builder: AddTaskView(
                                taskCtrl: BlocProvider.of<ToDoCubit>(context)
                                    .taskCtrl,
                                formKey: GlobalKey<FormState>()));
                      } else {}
                    },
                  ),
            bottomNavigationBar: CustombottomBar(
              currentIndex:
                  BlocProvider.of<NavigationBarCubit>(context).currentIndex,
            ),
            body: BlocBuilder<NavigationBarCubit, NavigationBarState>(
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
