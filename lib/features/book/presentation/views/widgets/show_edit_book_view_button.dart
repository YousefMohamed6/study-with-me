import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_text_button.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/edit_book_name_view.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class ShowEditBookViewButton extends StatelessWidget {
  const ShowEditBookViewButton({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        BlocProvider.of<HomeCubit>(context).showBottomSheet(
          builder: EditBookNameView(
              controller: BlocProvider.of<BookCubit>(context).bookCtrl,
              formKey: GlobalKey<FormState>(),
              book: book),
          context: context,
        );
      },
      text: book.name,
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }
}
