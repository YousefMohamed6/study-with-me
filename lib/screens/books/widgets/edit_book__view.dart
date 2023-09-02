import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper/show_message.dart';
import 'package:noteapp/helper_widgets/custom_button.dart';
import 'package:noteapp/helper_widgets/custom_form_field.dart';
import 'package:noteapp/helper_widgets/custom_icon_button.dart';
import 'package:noteapp/helper_widgets/custom_text.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/books/cubit/book_cubit.dart';
import 'package:noteapp/screens/books/model/book_model.dart';

class EditBookView extends StatefulWidget {
  const EditBookView(
      {super.key,
      required this.controller,
      required this.formkey,
      required this.book});
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;
  final BookModel book;

  @override
  State<EditBookView> createState() => _EditBookViewState();
}

class _EditBookViewState extends State<EditBookView> {
  String? bookPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: widget.formkey,
            child: CustomFormField(
              controller: widget.controller..text = widget.book.name,
              lablelText: 'Book Name',
            ),
          ),
          CustomIconButton(
            onPressed: () async {
              bookPath = await BlocProvider.of<BookCubit>(context).pdfPicker();
            },
            icon: const Icon(Icons.file_open_rounded, size: 32),
          ),
          const VerticalSizedBox(16),
          CustomButton(
            onPressed: () {
              if (widget.formkey.currentState!.validate()) {
                if (bookPath != null) {
                  BlocProvider.of<BookCubit>(context).editBook(
                      bookPath: bookPath!,
                      bookName: widget.controller.text,
                      book: widget.book);
                } else {
                  ShowMessage.show(context, msg: 'Please Select PDF');
                }
              }
            },
            color: Colors.white,
            child: const CustomText(
              text: 'Save',
              color: Colors.black,
            ),
          ),
          const VerticalSizedBox(8),
        ],
      ),
    );
  }
}
