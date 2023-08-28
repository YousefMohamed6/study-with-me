import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/model/note_model.dart';
import 'package:noteapp/views/widgets/note_sheet.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel> notes = [];
  var contentCtrl = TextEditingController();
  var titleCtrl = TextEditingController();
  void showBottomSheet(context) {
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

  void saveNote(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      await noteBox.add(note);
      await noteBox.close();
      notes.add(note);
      emit(AddSuccess());
    } on Exception {
      emit(AddFailure('Failed'));
    }
  }
}
