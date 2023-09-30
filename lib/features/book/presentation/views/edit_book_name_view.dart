import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_action_button.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_text_feild.dart';
import 'package:studytome/generated/l10n.dart';

class EditBookNameView extends StatelessWidget {
  const EditBookNameView(
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
          BookFormFeild(
            controller: controller..text = book.name,
            formKey: formKey,
          ),
          const SizedBox(height: 16),
          BookActionButton(
            actionName: S.of(context).save,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<BookCubit>(context).editBookName(book: book);
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
