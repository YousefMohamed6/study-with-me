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

  void searchBook({required String input}) {
    List<BookModel> result = [];
    for (BookModel book in booksList) {
      if (book.name.contains(input)) {
        result.add(book);
      }
    }
    emit(BookSearch(booksList: result));
  }

  Future<void> pdfPickerFromMemory() async {
    try {
      final pdf = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      bookPath = pdf!.paths.first!;
      emit(PickBookSuccess());
    } catch (_) {
      emit(PickBookFailure());
    }
  }

  void addBook() {
    try {
      if (bookPath != null) {
        var bookBox = Hive.box<BookModel>(kBookBox);
        var book = BookModel(name: bookCtrl.text, path: bookPath!);
        bookBox.add(book);
        fetchBooksFromMemory();
        emit(AddBookSuccess());
        bookPath = null;
        bookCtrl.clear();
      } else {
        emit(UnSelectedBook());
      }
    } catch (_) {
      emit(AddBookFailure());
    }
  }

  void deleteBookFromMemory({required BookModel book}) {
    book.delete();
    fetchBooksFromMemory();
  }

  void editBookPath({required BookModel book}) {
    try {
      if (bookPath != null) {
        book.name = bookCtrl.text;
        book.path = bookPath!;
        book.save();
        fetchBooksFromMemory();
        emit(EditBookSuccess());
        bookPath = null;
        bookCtrl.clear();
      } else {
        emit(UnSelectedBook());
      }
    } catch (_) {
      emit(EditBookFailure());
    }
  }

  void editBookName({required BookModel book}) {
    try {
      book.name = bookCtrl.text;
      book.save();
      emit(EditBookSuccess());
      fetchBooksFromMemory();
      bookCtrl.clear();
    } catch (_) {
      emit(EditBookFailure());
    }
  }

  void fetchBooksFromMemory() {
    booksList.clear();
    var bookBox = Hive.box<BookModel>(kBookBox);
    booksList.addAll(bookBox.values.toList());
    emit(BookInitial());
  }
}
