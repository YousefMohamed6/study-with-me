import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/core/helper_widgets/custom_appbar.dart';
import 'package:studytome/features/book/data/cubit/book_cubit.dart';
import 'package:studytome/features/book/presentation/views/widgets/book__list_view.dart';

class BookViewBody extends StatelessWidget {
  const BookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: 'Book',
            onPressed: () {},
          ),
          BookListView(
            booksList: BlocProvider.of<BookCubit>(context).booksList,
          ),
        ],
      ),
    );
  }
}
