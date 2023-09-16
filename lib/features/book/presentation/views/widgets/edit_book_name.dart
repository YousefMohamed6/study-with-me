import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/add_book_view.dart';

class EditBookName extends StatelessWidget {
  const EditBookName(
      {super.key,
      required this.book,
      required this.formKey,
      required this.controller});
  final BookModel book;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddPdfTextFeild(
            controller: controller..text = book.name,
            formKey: formKey,
          ),
          const SizedBox(height: 16),
          SaveBookNameButton(
            book: book,
            formKey: formKey,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class SaveBookNameButton extends StatelessWidget {
  const SaveBookNameButton(
      {super.key, required this.formKey, required this.book});
  final GlobalKey<FormState> formKey;
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<BookCubit>(context).editBookName(book: book);
        }
      },
      color: Colors.white,
      child: const CustomText(
        text: 'Save',
        color: Colors.black,
      ),
    );
  }
}
