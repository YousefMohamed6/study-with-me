import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/const/images.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text_button.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/edit_book__view.dart';
import 'package:studytome/features/book/presentation/views/widgets/edit_book_name.dart';
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
        BlocProvider.of<HomeCubit>(context).showPdf(book);
      },
      onTap: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
            builder: EditBookView(
                book: book,
                controller: BlocProvider.of<BookCubit>(context).bookCtrl,
                formkey: GlobalKey<FormState>()),
            context: context);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              kPdfLogo,
            ),
            Positioned(
              right: 1,
              top: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CustomIconButton(
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context).showAlertDialog(
                        context: context,
                        ok: () {
                          BlocProvider.of<BookCubit>(context).deleteBook(book);
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            CustomTextButton(
              onPressed: () {
                BlocProvider.of<HomeCubit>(context).showBottomSheet(
                    builder: EditBookName(
                        controller:
                            BlocProvider.of<BookCubit>(context).bookCtrl,
                        formKey: GlobalKey<FormState>(),
                        book: book),
                    context: context);
              },
              text: book.name,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
