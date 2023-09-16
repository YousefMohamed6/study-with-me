import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';

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
            EditTitleTextFeild(titleCtrl: titleCtrl, noteTitle: note.title),
            EditContentTextFeild(
              contentCtrl: contentCtrl,
              noteContent: note.content,
            ),
            const SizedBox(height: 8),
            BlocProvider.of<HomeCubit>(context).colorPickerView(),
            const SizedBox(height: 16),
            SaveEditNoteButton(formKey: formKey, note: note),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class EditTitleTextFeild extends StatelessWidget {
  const EditTitleTextFeild(
      {super.key, required this.titleCtrl, required this.noteTitle});
  final TextEditingController titleCtrl;
  final String noteTitle;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller: titleCtrl..text = noteTitle,
      lablelText: 'Title',
    );
  }
}

class EditContentTextFeild extends StatelessWidget {
  const EditContentTextFeild(
      {super.key, required this.contentCtrl, required this.noteContent});
  final TextEditingController contentCtrl;
  final String noteContent;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller: contentCtrl..text = noteContent,
      lablelText: 'Content',
      maxLine: 5,
    );
  }
}

class SaveEditNoteButton extends StatelessWidget {
  const SaveEditNoteButton(
      {super.key, required this.formKey, required this.note});
  final GlobalKey<FormState> formKey;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<NoteCubit>(context).editNote(
            note: note,
            color: BlocProvider.of<HomeCubit>(context).color,
          );
        }
      },
      color: Colors.white,
      child: const CustomText(
        text: 'Save',
        color: Colors.black,
      ),
    );
  }
}
