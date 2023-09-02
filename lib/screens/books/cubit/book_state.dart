part of 'book_cubit.dart';

sealed class BookState {}

final class BookInitial extends BookState {}

class AddBookSuccess extends BookState {}

class AddBookFailure extends BookState {}

class DeleteBookSuccess extends BookState {}

class DeleteBookFailure extends BookState {}

class EditBookSuccess extends BookState {}

class EditBookFailure extends BookState {}

class PickBookSuccess extends BookState {}

class PickBookFailure extends BookState {}
