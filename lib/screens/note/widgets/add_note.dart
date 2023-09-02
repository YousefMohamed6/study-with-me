import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/home/cubit/home_cubit.dart';
import 'package:noteapp/screens/note/model/note_model.dart';
import 'package:noteapp/screens/note/note_cubit/note_cubit.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
    required this.titleCtrl,
    required this.contentCtrl,
    required this.formkey,
  });
  final TextEditingController titleCtrl;
  final TextEditingController contentCtrl;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFormField(
            controller: titleCtrl..text = ' ',
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
          const VerticalSizedBox(8),
          BlocProvider.of<HomeCubit>(context).colorPicker(),
          const VerticalSizedBox(16),
          CustomButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                NoteModel note = NoteModel(
                  color: BlocProvider.of<NoteCubit>(context).color,
                  title: titleCtrl.text,
                  content: contentCtrl.text,
                  date: DateTime.now().toString().substring(0, 10),
                );
                BlocProvider.of<NoteCubit>(context).addNote(note);
              }
            },
            color: Colors.white,
            child: const CustomText(text: 'Add', color: Colors.black),
          ),
          const VerticalSizedBox(8),
        ],
      ),
    );
  }
}
