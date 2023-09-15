import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key, required this.notes});

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is NoteInitial) {
        } else if (state is AddNoteSuccess) {
          ShowMessage.show(context, msg: 'Add Success');
          Navigator.pop(context);
        } else if (state is AddNoteFailure) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        } else if (state is EditNoteSuccess) {
          ShowMessage.show(context, msg: 'Edit Success');
          Navigator.pop(context);
        } else if (state is EditNoteFailure) {
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