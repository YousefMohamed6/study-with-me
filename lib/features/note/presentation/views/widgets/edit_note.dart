import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
    required this.formKey,
    required this.titleCtrl,
    required this.contentCtrl,
    required this.note,
  });
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
            CustomFormField(
              controller: titleCtrl..text = note.title,
              lablelText: 'Title',
            ),
            CustomFormField(
              controller: contentCtrl..text = note.content,
              lablelText: 'Content',
              maxLine: 5,
            ),
            const SizedBox(height: 8),
            BlocProvider.of<HomeCubit>(context).colorPicker(),
            const SizedBox(height: 16),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<NoteCubit>(context).editNote(note);
                }
              },
              color: Colors.white,
              child: const CustomText(
                text: 'Save',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
