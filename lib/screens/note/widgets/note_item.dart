import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_icon_button.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/note/model/note_model.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/screens/note/widgets/edit_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<HomeCubit>(context).showBottomSheet(
              context,
              builder: EditNote(
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
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<HomeCubit>(context).showAlertDialog(
                        context: context,
                        ok: () {
                          noteModel.delete();
                          BlocProvider.of<NoteCubit>(context).fetshNotes();
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
      },
    );
  }
}
