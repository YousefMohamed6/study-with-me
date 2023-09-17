import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/color_picker_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/widgets/content_form_feild.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_action_button.dart';
import 'package:studytome/features/note/presentation/views/widgets/title_form_feild.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView(
      {super.key,
      required this.formKey,
      required this.titleCtrl,
      required this.contentCtrl,
      required this.note});
  final TextEditingController titleCtrl;
  final TextEditingController contentCtrl;
  final NoteModel note;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleFormFeild(
              titleCtrl: titleCtrl..text = note.title,
            ),
            ContentFormFeild(
              contentCtrl: contentCtrl..text = note.content,
            ),
            const SizedBox(height: 8),
            ColorPickerView(
              colors: BlocProvider.of<HomeCubit>(context).colors,
            ),
            const SizedBox(height: 16),
            NoteActionButton(
              actionName: 'Save',
              onPressed: () {
                BlocProvider.of<NoteCubit>(context).editNote(
                  note: note,
                  color: BlocProvider.of<HomeCubit>(context).color,
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
