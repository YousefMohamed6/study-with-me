import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/screens/books/cubit/book_cubit.dart';
import 'package:noteapp/screens/books/widgets/add_book_view.dart';
import 'package:noteapp/screens/books/widgets/book_view.dart';
import 'package:noteapp/screens/books/widgets/show_book__view.dart';
import 'package:noteapp/screens/contact_us/about_me.dart';
import 'package:noteapp/screens/image/cubit/image_cubit.dart';
import 'package:noteapp/screens/image/widgets/add_image_view.dart';
import 'package:noteapp/screens/image/widgets/image_view.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/home/widgets/navigationbar.dart';
import 'package:noteapp/screens/image/widgets/show_image_view.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/screens/note/widgets/add_note.dart';
import 'package:noteapp/screens/note/widgets/note_view.dart';
import 'package:noteapp/screens/todo/todo_cubit/todo_cubit.dart';
import 'package:noteapp/screens/todo/widgets/add_task.dart';
import 'package:noteapp/screens/todo/widgets/todo_view.dart';
import 'package:noteapp/screens/google/webview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ShowPDF) {
          return ShowPDFView(book: state.book);
        } else if (state is ShowImage) {
          return ShowImageView(image: state.image);
        } else if (state is Google) {
          return const WebViewApp(url: 'https://www.google.com/');
        } else {
          return Scaffold(
            floatingActionButton: state is ContactUs
                ? null
                : FloatingActionButton(
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
                            controller:
                                BlocProvider.of<BookCubit>(context).bookCtrl,
                            formkey: GlobalKey<FormState>(),
                          ),
                        );
                      } else if (state is Images) {
                        BlocProvider.of<HomeCubit>(context).showBottomSheet(
                          context: context,
                          builder: AddImageView(
                            controller:
                                BlocProvider.of<ImageCubit>(context).imageCtrl,
                            formkey: GlobalKey<FormState>(),
                          ),
                        );
                      } else if (state is Note) {
                        BlocProvider.of<HomeCubit>(context).showBottomSheet(
                          context: context,
                          builder: AddNoteView(
                            titleCtrl:
                                BlocProvider.of<NoteCubit>(context).titleCtrl,
                            contentCtrl:
                                BlocProvider.of<NoteCubit>(context).contentCtrl,
                            formkey: GlobalKey<FormState>(),
                          ),
                        );
                      } else if (state is ToDo) {
                        BlocProvider.of<HomeCubit>(context).showBottomSheet(
                          context: context,
                          builder: AddTaskView(
                            taskCtrl:
                                BlocProvider.of<ToDoCubit>(context).taskCtrl,
                            formKey: GlobalKey<FormState>(),
                          ),
                        );
                      }
                    },
                  ),
            bottomNavigationBar: CustombottomBar(
              currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
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
                  return const AboutMeView();
                }
              },
            ),
          );
        }
      },
    );
  }
}
