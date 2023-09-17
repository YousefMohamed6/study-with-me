part of 'home_cubit.dart';

abstract class HomeState {}

class Book extends HomeState {}

class Images extends HomeState {}

class Note extends HomeState {}

class ToDo extends HomeState {}

class WebView extends HomeState {}

class ContactUs extends HomeState {}

class ShowImage extends HomeState {
  final ImageModel image;
  ShowImage({required this.image});
}

class ShowBook extends HomeState {
  final BookModel book;
  ShowBook({required this.book});
}

class ShowNote extends HomeState {
  final NoteModel note;
  ShowNote({required this.note});
}
