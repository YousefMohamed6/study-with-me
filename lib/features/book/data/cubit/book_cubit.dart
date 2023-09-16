import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/features/book/data/model/book_model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  String? bookPath;
  List<BookModel> booksList = [];
  final bookCtrl = TextEditingController();

  Future<void> pdfPicker() async {
    try {
      final pdf = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      bookPath = pdf!.paths.first!;
      emit(PickBookSuccess());
    } on Exception catch (_) {
      emit(PickBookFailure());
    }
  }

  void addBook() {
    try {
      if (bookPath != null) {
        var bookBox = Hive.box<BookModel>(kBookBox);
        var book = BookModel(name: bookCtrl.text, path: bookPath!);
        bookBox.add(book);
        fetchBooks();
        emit(AddBookSuccess());
      } else {
        emit(AddBookPathFailure());
      }
    } on Exception {
      emit(AddBookFailure());
    }
    bookPath = null;
    bookCtrl.clear();
  }

  void deleteBook(BookModel book) {
    book.delete();
    fetchBooks();
  }

  void editBookPath({required BookModel book}) {
    try {
      if (bookPath != null) {
        book.name = bookCtrl.text;
        book.path = bookPath!;
        book.save();
        fetchBooks();
        emit(EditBookSuccess());
      } else {
        emit(AddBookPathFailure());
      }
    } on Exception {
      emit(EditBookFailure());
    }
    bookPath = null;
    bookCtrl.clear();
  }

  void editBookName({required BookModel book}) {
    try {
      book.name = bookCtrl.text;
      book.save();
      emit(EditBookSuccess());
      fetchBooks();
    } on Exception {
      emit(EditBookFailure());
    }
    bookCtrl.clear();
  }

  void fetchBooks() {
    booksList.clear();
    var bookBox = Hive.box<BookModel>(kBookBox);
    booksList.addAll(bookBox.values.toList());
    emit(BookInitial());
  }
}
