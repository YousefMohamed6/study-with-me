import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/note/note_cubit.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/views/widgets/note_item.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) => Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: notes.length,
          itemBuilder: (context, index) => NoteItem(
            noteModel: notes[index],
          ),
        ),
      ),
    );
  }
}
