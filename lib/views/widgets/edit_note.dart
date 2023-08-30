import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/note/note_cubit.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_form_field.dart';
import 'package:noteapp/views/widgets/custom_text.dart';
import 'package:noteapp/views/widgets/vertical_sizebox.dart';

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
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFormField(
            controller: titleCtrl,
            initialValue: note.title,
          ),
          CustomFormField(
            controller: contentCtrl,
            initialValue: note.content,
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
            child: const CustomText(text: 'Save'),
          )
        ],
      ),
    );
  }
}
