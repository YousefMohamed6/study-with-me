import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          context: context,
          builder: EditNoteView(
            note: noteModel,
            titleCtrl: BlocProvider.of<NoteCubit>(context).titleCtrl,
            contentCtrl: BlocProvider.of<NoteCubit>(context).contentCtrl,
            formKey: GlobalKey<FormState>(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 24.0,
          left: 24.0,
          right: 16,
        ),
        margin: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(noteModel.color),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: CustomText(
                text: noteModel.title,
                fontWeight: FontWeight.bold,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CustomText(
                  text: noteModel.content,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: CustomIconButton(
                iconSize: 32,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).showAlertDialog(
                    context: context,
                    onPressOk: () {
                      noteModel.delete();
                      BlocProvider.of<NoteCubit>(context).fetchNotes();
                    },
                  );
                },
              ),
            ),
            CustomText(
              text: noteModel.date,
            ),
          ],
        ),
      ),
    );
  }
}
