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

class AddBookView extends StatefulWidget {
  const AddBookView(
      {super.key, required this.controller, required this.formkey});
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;

  @override
  State<AddBookView> createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  String? imagePath;
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
              controller: widget.controller,
              lablelText: 'Book Name',
            ),
          ),
          CustomIconButton(
            onPressed: () async {
              imagePath = await BlocProvider.of<BookCubit>(context).pdfPicker();
            },
            icon: const Icon(
              Icons.file_open_rounded,
              size: 40,
            ),
          ),
          const VerticalSizedBox(16),
          CustomButton(
            onPressed: () {
              if (widget.formkey.currentState!.validate()) {
                if (imagePath != null) {
                  BlocProvider.of<BookCubit>(context).addBook(
                    BookModel(
                      path: imagePath!,
                      name: widget.controller.text,
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  ShowMessage.show(context, msg: 'Please Select PDF');
                }
              }
            },
            color: Colors.white,
            child: const CustomText(
              text: 'Add',
              color: Colors.black,
            ),
          ),
          const VerticalSizedBox(8),
        ],
      ),
    );
  }
}
