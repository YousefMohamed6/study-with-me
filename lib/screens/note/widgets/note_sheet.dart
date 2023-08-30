import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/note/model/note_model.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';
import 'package:noteapp/helper/show_message.dart';

class AddNoteSheet extends StatelessWidget {
  static String id = 'NoteSheet';
  const AddNoteSheet(
      {super.key,
      required this.titleCtrl,
      required this.contentCtrl,
      required this.formkey, required this.color});
  final TextEditingController titleCtrl;
  final TextEditingController contentCtrl;
  final GlobalKey<FormState> formkey;
  final int color;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          ShowMessage.show(context, msg: 'Success');
          Navigator.pop(context);
        } else if (state is AddNoteFailure) {
          ShowMessage.show(context, msg: state.errMessage);
          Navigator.pop(context);
        }
      },
      builder: (context, state) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormField(
              controller: titleCtrl,
              lablelText: 'Title',
            ),
            Form(
              key: formkey,
              child: CustomFormField(
                controller: contentCtrl,
                lablelText: 'Content',
                maxLine: 5,
              ),
            ),
            const VerticalSizedBox(24),
            CustomButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  NoteModel note = NoteModel(
                    color: color,
                    title: titleCtrl.text,
                    content: contentCtrl.text,
                    date: DateTime.now().toString().substring(0, 16),
                  );
                  BlocProvider.of<NoteCubit>(context).addNote(note);
                }
              },
              color: Colors.white,
              child: const CustomText(text: 'Add', color: Colors.black),
            ),
            const VerticalSizedBox(16),
          ],
        ),
      ),
    );
  }
}
