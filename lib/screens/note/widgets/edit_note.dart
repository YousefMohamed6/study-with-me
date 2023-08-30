import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/screens/note/model/note_model.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';

class EditNote extends StatelessWidget {
  const EditNote({
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
            ),
            CustomFormField(
              controller: contentCtrl..text = note.content,
              maxLine: 5,
            ),
            const VerticalSizedBox(24),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<NoteCubit>(context).editNote(note);
                }
              },
              color: Colors.white,
              child: const CustomText(
                text: 'Save',
                color: Colors.black,
              ),
            ),
            const VerticalSizedBox(16),
          ],
        ),
      ),
    );
  }
}
