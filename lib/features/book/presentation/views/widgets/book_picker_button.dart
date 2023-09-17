import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';

class BookPickerButton extends StatelessWidget {
  const BookPickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await BlocProvider.of<BookCubit>(context).pdfPickerFromMemory();
      },
      icon: const Icon(
        Icons.file_open_rounded,
        size: 40,
      ),
    );
  }
}
