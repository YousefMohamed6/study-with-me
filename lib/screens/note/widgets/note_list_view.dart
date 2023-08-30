import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper/show_message.dart';
import 'package:noteapp/screens/note/model/note_model.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/screens/note/widgets/note_item.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key, required this.notes});
  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is EditNoteSuccess) {
          Navigator.pop(context);
        }
        if (state is EditNoteFailure) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        }
      },
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
