import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/features/note/data/model/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel> notesList = [];

  var titleCtrl = TextEditingController();
  var contentCtrl = TextEditingController();

  void editNote({required NoteModel note, required int color}) {
    note.content = contentCtrl.text;
    note.title = titleCtrl.text;
    note.color = color;
    note.save();
    titleCtrl.clear();
    contentCtrl.clear();
    emit(EditNoteSuccess());
    fetchNotes();
  }

  void addNote(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
      titleCtrl.clear();
      fetchNotes();
    } on Exception {
      emit(AddNoteFailure('Failed'));
      emit(NoteInitial());
    }
  }

  void fetchNotes() async {
    notesList.clear();
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    notesList.addAll(noteBox.values.toList());
    emit(NoteInitial());
  }
}
