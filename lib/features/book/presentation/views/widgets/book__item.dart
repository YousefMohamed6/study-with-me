import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/const/images.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/delete_book_button.dart';
import 'package:studytome/features/book/presentation/views/widgets/edit_book__view.dart';
import 'package:studytome/features/book/presentation/views/widgets/show_edit_book_view_button.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        BlocProvider.of<HomeCubit>(context).showBookView(book: book);
      },
      onTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          builder: EditBookView(
            book: book,
            controller: BlocProvider.of<BookCubit>(context).bookCtrl,
            formKey: GlobalKey<FormState>(),
          ),
          context: context,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.05),
          image: const DecorationImage(
              image: AssetImage(kPdfLogo), fit: BoxFit.fill),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DeleteBookButton(book: book),
            ShowEditBookViewButton(book: book),
          ],
        ),
      ),
    );
  }
}
