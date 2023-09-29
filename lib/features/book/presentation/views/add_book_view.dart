import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_action_button.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_picker_button.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_text_feild.dart';
import 'package:studytome/generated/l10n.dart';

class AddBookView extends StatelessWidget {
  const AddBookView(
      {super.key, required this.controller, required this.formKey});
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BookFormFeild(
            controller: controller,
            formKey: formKey,
          ),
          const BookPickerButton(),
          const SizedBox(height: 16),
          BookActionButton(
            actionName: S.of(context).add,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<BookCubit>(context).addBook();
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
