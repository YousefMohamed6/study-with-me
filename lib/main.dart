import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/cubits/book/book_cubit.dart';
import 'package:noteapp/cubits/file/file_cubit.dart';
import 'package:noteapp/cubits/navigatorbar/navigatore_cubit.dart';
import 'package:noteapp/cubits/note/note_cubit.dart';
import 'package:noteapp/cubits/todo/todo_cubit.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/views/screens/books_view.dart';
import 'package:noteapp/views/screens/home_view.dart';
import 'package:noteapp/views/screens/note_view.dart';
import 'package:noteapp/views/screens/file_view.dart';
import 'package:noteapp/views/screens/todo_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  Hive.registerAdapter(NoteModelAdapter());
  // await Hive.openBox(kFileBox);
  // await Hive.openBox(kNoteBox);
  // await Hive.openBox(kToDoBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NavigationBarCubit(),
        ),
        RepositoryProvider(
          create: (context) => BookCubit(),
        ),
        RepositoryProvider(
          create: (context) => FileCubit(),
        ),
        RepositoryProvider(
          create: (context) => NoteCubit(),
        ),
        RepositoryProvider(
          create: (context) => ToDoCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NoteApp',
        theme: ThemeData.dark(),
        home: const HomeView(),
        routes: {
          NoteView.id: (context) => const NoteView(),
          FileView.id: (context) => const FileView(),
          ToDoView.id: (context) => const ToDoView(),
          BookView.id: (context) => const BookView(),
        },
      ),
    );
  }
}
