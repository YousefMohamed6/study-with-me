import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/utils/show_message.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/presentation/views/widgets/book_view_body.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});
  static String id = 'Books';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        if (state is AddBookSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Add Success');
        } else if (state is AddBookFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Faild,try again');
        } else if (state is EditBookSuccess) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Edit Success');
        } else if (state is EditBookFailure) {
          Navigator.pop(context);
          ShowMessage.show(context, msg: 'Faild,try again');
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: BookViewBody(),
        );
      },
    );
  }
}
