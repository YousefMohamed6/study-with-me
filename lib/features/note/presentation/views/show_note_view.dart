import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_back_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/core/helper_widgets/share_text_button.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/model/note_model.dart';
import 'package:studytome/features/note/presentation/views/widgets/show_note_view_body.dart';

class ShowNoteView extends StatelessWidget {
  const ShowNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).changeIndex(2);
          },
        ),
        centerTitle: true,
        title: CustomText(
          text: note.title,
          color: Colors.white,
        ),
        actions: [
          ShareTextButton(
            text: note.content,
            subject: note.title,
          ),
        ],
      ),
      body: ShowNoteViewBody(
        note: note,
      ),
    );
  }
}
