import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/delete_button.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/data/model/book_model.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';

class DeleteBookButton extends StatelessWidget {
  const DeleteBookButton({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 1,
      top: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: DeleteButton(
          color: Colors.red,
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).showAlertDialog(
              context: context,
              onPressOk: () {
                BlocProvider.of<BookCubit>(context)
                    .deleteBookFromMemory(book: book);
              },
            );
          },
        ),
      ),
    );
  }
}
