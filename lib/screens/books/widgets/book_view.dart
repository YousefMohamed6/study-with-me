import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/helper/show_message.dart';
import 'package:noteapp/helper_widgets/custom_appbar.dart';
import 'package:noteapp/helper_widgets/vertical_sizebox.dart';
import 'package:noteapp/screens/books/cubit/book_cubit.dart';
import 'package:noteapp/screens/books/widgets/book__list_view.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});
  static String id = 'Books';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        if (state is AddBookSuccess) {
          ShowMessage.show(context, msg: 'Add Pdf Success');
          Navigator.pop(context);
        } else if (state is AddBookFailure) {
          ShowMessage.show(context, msg: 'Faild ,try again');
          Navigator.pop(context);
        } else if (state is EditBookSuccess) {
          ShowMessage.show(context, msg: 'Edit Pdf Success');
        } else if (state is EditBookFailure) {
          ShowMessage.show(context, msg: 'Faild ,try again');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const VerticalSizedBox(16),
              CustomAppBar(
                title: 'Book',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              Expanded(
                child: BookListView(
                  books: BlocProvider.of<BookCubit>(context).books,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
