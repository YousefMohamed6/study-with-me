part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class Add extends NoteState {}

class AddSuccess extends NoteState {}

class AddFailure extends NoteState {
  final String errMessage;

  AddFailure(this.errMessage);
}

class Remove extends NoteState {}
