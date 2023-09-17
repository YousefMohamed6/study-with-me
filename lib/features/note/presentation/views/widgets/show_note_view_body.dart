import 'package:flutter/material.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/note/data/model/note_model.dart';

class ShowNoteViewBody extends StatelessWidget {
  const ShowNoteViewBody({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: note.date,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
              ],
            ),
            CustomText(
              text: note.content,
              fontSize: 20,
            )
          ],
        ),
      ),
    );
  }
}
