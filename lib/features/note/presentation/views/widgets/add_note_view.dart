import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/color_picker_view.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';

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
          AddTitleTextFeild(titleCtrl: titleCtrl),
          AddContentTextFeild(
            contentCtrl: contentCtrl,
            formkey: formkey,
          ),
          const SizedBox(height: 8),
          ColorPickerView(
            colors: BlocProvider.of<HomeCubit>(context).colors,
          ),
          const SizedBox(height: 16),
          AddNoteButton(
            titleCtrl: titleCtrl,
            contentCtrl: contentCtrl,
            formkey: formkey,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class AddTitleTextFeild extends StatelessWidget {
  const AddTitleTextFeild({super.key, required this.titleCtrl});
  final TextEditingController titleCtrl;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller: titleCtrl..text = '',
      lablelText: 'Title',
    );
  }
}

class AddContentTextFeild extends StatelessWidget {
  const AddContentTextFeild(
      {super.key, required this.contentCtrl, required this.formkey});
  final TextEditingController contentCtrl;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: CustomFormField(
        controller: contentCtrl,
        lablelText: 'Content',
        maxLine: 5,
      ),
    );
  }
}

class AddNoteButton extends StatelessWidget {
  const AddNoteButton(
      {super.key,
      required this.titleCtrl,
      required this.contentCtrl,
      required this.formkey});
  final TextEditingController titleCtrl;
  final TextEditingController contentCtrl;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (formkey.currentState!.validate()) {
          NoteModel note = NoteModel(
            color: BlocProvider.of<HomeCubit>(context).color,
            title: titleCtrl.text,
            content: contentCtrl.text,
            date: DateTime.now().toString().substring(0, 10),
          );
          BlocProvider.of<NoteCubit>(context).addNote(note);
        }
      },
      color: Colors.white,
      child: const CustomText(text: 'Add', color: Colors.black),
    );
  }
}
