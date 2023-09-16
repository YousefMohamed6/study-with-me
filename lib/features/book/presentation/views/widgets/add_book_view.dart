import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_button.dart';
import 'package:studytome/core/helper_widgets/custom_form_field.dart';
import 'package:studytome/core/helper_widgets/custom_icon_button.dart';
import 'package:studytome/core/helper_widgets/custom_text.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';

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
          AddBookTextFeild(
            controller: controller,
            formKey: formKey,
          ),
          const BookPickerButton(),
          const SizedBox(height: 16),
          AddBookButton(formKey: formKey),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class AddBookTextFeild extends StatelessWidget {
  const AddBookTextFeild(
      {super.key, required this.controller, required this.formKey});
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFormField(
        controller: controller,
        lablelText: 'Book Name',
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
      icon: const Icon(
        Icons.file_open_rounded,
        size: 40,
      ),
    );
  }
}

class AddBookButton extends StatelessWidget {
  const AddBookButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<BookCubit>(context).addBook();
        }
      },
      color: Colors.white,
      child: const CustomText(
        text: 'Add',
        color: Colors.black,
      ),
    );
  }
}
