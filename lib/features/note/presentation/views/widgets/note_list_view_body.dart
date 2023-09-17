import 'package:flutter/material.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_item.dart';

class NoteListViewBody extends StatelessWidget {
  const NoteListViewBody({super.key, required this.notesList});
  final List<NoteModel> notesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: notesList.length,
        itemBuilder: (context, index) => NoteItem(
          note: notesList[index],
        ),
      ),
    );
  }
}
