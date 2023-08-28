import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/views/screens/note_sheet.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  
  void addNote(BuildContext context) {
    var contentCtrl = TextEditingController();
    var titleCtrl = TextEditingController();
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => NoteSheet(
        titleCtrl: titleCtrl,
        contentCtrl: contentCtrl,
        formkey: GlobalKey<FormState>(),
      ),
    );
  }
}
