import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/cubit/navigatore_cubit.dart';
import 'package:noteapp/cubit/note_cubit.dart';
import 'package:noteapp/views/screens/note_view.dart';
import 'package:noteapp/views/screens/pdf_view.dart';
import 'package:noteapp/views/screens/todo_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NavigatoreCubit(),
        ),
        RepositoryProvider(
          create: (context) => NoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NoteApp',
        theme: ThemeData.dark(),
        home: const NotePage(),
        routes: {
          NotePage.id: (context) => const NotePage(),
          PdfView.id: (context) => const PdfView(),
          ToDoView.id: (context) => const ToDoView(),
        },
        initialRoute: NotePage.id,
      ),
    );
  }
}
