part of 'home_cubit.dart';

abstract class HomeState {}

final class Book extends HomeState {}

final class Images extends HomeState {}

final class Note extends HomeState {}

final class ToDo extends HomeState {}

final class WebView extends HomeState {}

final class ContactUs extends HomeState {}

final class ShowImage extends HomeState {
  final ImageModel image;
  ShowImage({required this.image});
}

final class ShowBook extends HomeState {
  final BookModel book;
  ShowBook({required this.book});
}

final class ShowNote extends HomeState {
  final NoteModel note;
  ShowNote({required this.note});
}
