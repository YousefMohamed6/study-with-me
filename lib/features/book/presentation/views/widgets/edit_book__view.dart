import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';

class EditBookView extends StatelessWidget {
  const EditBookView(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.book});
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EditBookTextFeild(
            controller: controller,
            bookName: book.name,
            formKey: formKey,
          ),
          const BookPickerButton(),
          const SizedBox(height: 16),
          SaveBookPathButton(book: book, formKey: formKey),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class BookPickerButton extends StatelessWidget {
  const BookPickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onPressed: () async {
        await BlocProvider.of<BookCubit>(context).pdfPicker();
      },
      icon: const Icon(Icons.file_open_rounded, size: 32),
    );
  }
}

class SaveBookPathButton extends StatelessWidget {
  const SaveBookPathButton(
      {super.key, required this.formKey, required this.book});
  final GlobalKey<FormState> formKey;
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<BookCubit>(context).editBook(book: book);
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

class EditBookTextFeild extends StatelessWidget {
  const EditBookTextFeild(
      {super.key,
      required this.controller,
      required this.bookName,
      required this.formKey});
  final TextEditingController controller;
  final String bookName;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFormField(
        controller: controller..text = bookName,
        lablelText: 'Book Name',
      ),
    );
  }
}
