import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_action_button.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_picker_button.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_text_feild.dart';

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
          BookFormFeild(
            controller: controller..text = book.name,
            formKey: formKey,
          ),
          const BookPickerButton(),
          const SizedBox(height: 16),
          BookActionButton(
            actionName: 'Save',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<BookCubit>(context).editBookPath(book: book);
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
