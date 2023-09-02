import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:noteapp/const/text.dart';
import 'package:noteapp/screens/books/model/book_model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  List<BookModel> books = [];
  final bookCtrl = TextEditingController();

  Future<String?> pdfPicker() async {
    try {
      final pdf = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      return pdf!.paths.first;
    } on Exception {
      return null;
    }
  }

  void addBook(BookModel book) {
    try {
      var bookBox = Hive.box<BookModel>(kBookBox);
      bookBox.add(book);
      bookCtrl.clear();
      emit(AddBookSuccess());
      fetchBooks();
    } on Exception {
      emit(AddBookFailure());
    }
  }

  void deleteBook(BookModel book) {
    book.delete();
    fetchBooks();
  }

  void editBook(
      {required String bookPath,
      required String bookName,
      required BookModel book}) {
    try {
      book.name = bookName;
      book.path = bookPath;
      book.save();
      bookCtrl.clear();
      emit(EditBookSuccess());
      fetchBooks();
    } on Exception {
      emit(EditBookFailure());
    }
  }

  void editBookName({required BookModel book}) {
    try {
      book.name = bookCtrl.text;
      book.save();
      bookCtrl.clear();
      emit(EditBookSuccess());
      fetchBooks();
    } on Exception {
      emit(EditBookFailure());
    }
  }

  void fetchBooks() {
    books.clear();
    var bookBox = Hive.box<BookModel>(kBookBox);
    books.addAll(bookBox.values.toList());
    emit(BookInitial());
  }
}
