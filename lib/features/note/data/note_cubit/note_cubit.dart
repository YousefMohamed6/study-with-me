import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/features/note/data/model/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel> notesList = [];
  final formKey = GlobalKey<FormState>();
  var titleCtrl = TextEditingController();
  var contentCtrl = TextEditingController();

  void searchNote({required String input}) {
    List<NoteModel> result = [];
    for (NoteModel note in notesList) {
      if (note.title.contains(input) || note.content.contains(input)) {
        result.add(note);
      }
    }
    emit(NoteSearch(notesList: result));
  }

  void addNoteToMemory({required int color}) async {
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      var note = NoteModel(
        color: color,
        title: titleCtrl.text,
        content: contentCtrl.text,
        date: DateTime.now().toString().substring(0, 10),
      );
      await noteBox.add(note);
      emit(AddNoteSuccess());
      fetchNotesFromMemory();
      titleCtrl.clear();
    } catch (_) {
      emit(AddNoteFailure('Failed'));
    }
  }

  void editNote({required NoteModel note, required int color}) async {
    note.content = contentCtrl.text;
    note.title = titleCtrl.text;
    note.color = color;
    await note.save();
    titleCtrl.clear();
    contentCtrl.clear();
    fetchNotesFromMemory();
    emit(EditNoteSuccess());
  }

  void deleteNote({required NoteModel note}) async {
    await note.delete();
    fetchNotesFromMemory();
  }

  void fetchNotesFromMemory() {
    notesList.clear();
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    notesList.addAll(noteBox.values.toList());
    emit(NoteInitial());
  }
}
