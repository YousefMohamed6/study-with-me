import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/color_picker_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/note/data/note_cubit/note_cubit.dart';
import 'package:studytome/features/note/presentation/views/widgets/content_form_feild.dart';
import 'package:studytome/features/note/presentation/views/widgets/note_action_button.dart';
import 'package:studytome/features/note/presentation/views/widgets/title_form_feild.dart';
import 'package:studytome/generated/l10n.dart';

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
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleFormFeild(titleCtrl: titleCtrl),
            ContentFormFeild(
              contentCtrl: contentCtrl,
            ),
            const SizedBox(height: 8),
            ColorPickerView(
              colors: BlocProvider.of<HomeCubit>(context).colors,
            ),
            const SizedBox(height: 16),
            NoteActionButton(
              actionName: S.of(context).add,
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  BlocProvider.of<NoteCubit>(context).addNoteToMemory(
                      color: BlocProvider.of<HomeCubit>(context).color);
                }
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
