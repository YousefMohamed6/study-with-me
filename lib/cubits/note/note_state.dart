part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class Add extends NoteState {}

class AddNoteSuccess extends NoteState {}

class AddNoteFailure extends NoteState {
  final String errMessage;

  AddNoteFailure(this.errMessage);
}

class Remove extends NoteState {}
