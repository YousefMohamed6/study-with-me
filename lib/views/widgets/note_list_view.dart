import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/note/note_cubit.dart';
import 'package:noteapp/views/widgets/note_item.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: BlocProvider.of<NoteCubit>(context).notes.length,
        itemBuilder: (context, index) => NoteItem(
          color: Colors.lightGreen,
          title: BlocProvider.of<NoteCubit>(context).notes[index].title,
          content: BlocProvider.of<NoteCubit>(context).notes[index].content,
          time: BlocProvider.of<NoteCubit>(context).notes[index].date,
        ),
      ),
    );
  }
}
