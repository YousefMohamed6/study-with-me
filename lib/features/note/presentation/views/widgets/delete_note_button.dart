import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      icon: const Icon(Icons.delete),
      onPressed: () {
        BlocProvider.of<HomeCubit>(context).showAlertDialog(
          context: context,
          onPressOk: () {
            BlocProvider.of<NoteCubit>(context).deleteNote(note: note);
          },
        );
      },
    );
  }
}
