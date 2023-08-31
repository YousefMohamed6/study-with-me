import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/screens/books/cubit/book_cubit.dart';
import 'package:noteapp/screens/image/cubit/image_cubit.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/home/widgets/home_view.dart';
import 'package:noteapp/screens/image/model/image_model.dart';
import 'package:noteapp/screens/note/model/note_model.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/screens/todo/todo_cubit/todo_cubit.dart';
import 'package:noteapp/screens/todo/todo_model/todo_model.dart';
import 'package:noteapp/simple_observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kToDoBox);
  Hive.registerAdapter(ImageModelAdapter());
  await Hive.openBox<ImageModel>(kImageBox);
  Bloc.observer = SimpleObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => HomeCubit(),
        ),
        RepositoryProvider(
          create: (context) => BookCubit(),
        ),
        RepositoryProvider(
          create: (context) => ImageCubit(),
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
      ),
    );
  }
}
