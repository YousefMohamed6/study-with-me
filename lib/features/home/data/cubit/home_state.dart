part of 'home_cubit.dart';

abstract class HomeState {}

class Book extends HomeState {}

class Images extends HomeState {}

class Note extends HomeState {}

class ToDo extends HomeState {}

class Google extends HomeState {}

class ContactUs extends HomeState {}

class ShowImage extends HomeState {
  final ImageModel image;
  ShowImage({required this.image});
}

class ShowPDF extends HomeState {
  final BookModel book;
  ShowPDF({required this.book});
}
