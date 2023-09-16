import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:studytome/core/const/text.dart';
import 'package:studytome/features/book/data/model/book_model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  List<BookModel> booksList = [];
  final bookCtrl = TextEditingController();
  String bookPath = '';
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
      var bookBox = Hive.box<BookModel>(kBookBox);
      var book = BookModel(name: bookCtrl.text, path: bookPath);
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

  void editBook({required BookModel book}) {
    try {
      book.name = bookCtrl.text;
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
    booksList.clear();
    var bookBox = Hive.box<BookModel>(kBookBox);
    booksList.addAll(bookBox.values.toList());
    emit(BookInitial());
  }
}
