import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/presentation/views/book_view.dart';
import 'package:studytome/features/book/presentation/views/widgets/add_book_view.dart';
import 'package:studytome/features/book/presentation/views/widgets/show_book__view.dart';
import 'package:studytome/features/contact_us/views/about_me_view.dart';
import 'package:studytome/features/google/views/webview.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/home/presentation/views/widgets/navigationbar.dart';
import 'package:studytome/features/image/data/cubit/image_cubit.dart';
import 'package:studytome/features/image/presentation/views/image_view.dart';
import 'package:studytome/features/image/presentation/views/widgets/add_image_view.dart';
import 'package:studytome/features/image/presentation/views/widgets/show_image_view.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/note_view.dart';
import 'package:studytome/features/note/presentation/views/widgets/add_note.dart';
import 'package:studytome/features/todo/data/todo_cubit/todo_cubit.dart';
import 'package:studytome/features/todo/presentation/views/todo_view.dart';
import 'package:studytome/features/todo/presentation/views/widgets/add_task.dart';

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
