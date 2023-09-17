import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/edit_note_view.dart';
import 'package:studytome/features/note/presentation/views/widgets/delete_note_button.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_background.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_content.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_titel.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          context: context,
          builder: EditNoteView(
            note: note,
            titleCtrl: BlocProvider.of<NoteCubit>(context).titleCtrl,
            contentCtrl: BlocProvider.of<NoteCubit>(context).contentCtrl,
            formKey: BlocProvider.of<NoteCubit>(context).formKey,
          ),
        );
      },
      onDoubleTap: () {
        BlocProvider.of<HomeCubit>(context).showNoteView(note: note);
      },
      child: NoteBackground(
        color: note.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: NoteTitle(title: note.title),
              subtitle: NoteContent(content: note.content),
              trailing: DeleteNoteButton(note: note),
            ),
            CustomText(text: note.date),
          ],
        ),
      ),
    );
  }
}
